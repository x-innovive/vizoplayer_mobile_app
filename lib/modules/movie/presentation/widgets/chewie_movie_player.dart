import 'dart:async';
import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';

final playerControllerInitialized = StateProvider.autoDispose.family((ref, url) => false);

// Providers for state management
final isPlayingProvider = StateProvider.autoDispose.family<bool, String>((ref, url) => false);
final isBufferingProvider = StateProvider.autoDispose.family<bool, String>((ref, url) => false);
final isMutedProvider = StateProvider.autoDispose.family<bool, String>((ref, url) => false);
final isFullScreenProvider = StateProvider.autoDispose.family<bool, String>((ref, url) => false);
final videoPositionProvider = StateProvider.autoDispose.family<Duration, String>((ref, url) => Duration.zero);
final videoDurationProvider = StateProvider.autoDispose.family<Duration, String>((ref, url) => Duration.zero);

class ChewieMoviePlayer extends ConsumerStatefulWidget {
  final String? url;

  const ChewieMoviePlayer({super.key, required this.url});

  @override
  ConsumerState<ChewieMoviePlayer> createState() => _MovieVideoPlayerState();
}

class _MovieVideoPlayerState extends ConsumerState<ChewieMoviePlayer> {
  late final VideoPlayerController _playerController;
  ChewieController? _chewieController;
  bool _showControls = true;
  Timer? _hideControlsTimer;

  @override
  void initState() {
    _initializePlayer();

    super.initState();
  }

  @override
  void dispose() {
    _playerController.dispose();
    _chewieController?.dispose();
    _hideControlsTimer?.cancel();

    super.dispose();
  }

  Future<void> _initializePlayer() async {
    _playerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.url ?? ''),
    );
    await _playerController.initialize();
    ref.read(videoDurationProvider(widget.url ?? '').notifier).state = _playerController.value.duration;
    _playerController.addListener(() {
      log('Listening');
      final isBuffering = _playerController.value.isBuffering;
      final isPlaying = _playerController.value.isPlaying;
      final position = _playerController.value.position;
      final currentPosition = _playerController.value.position.inSeconds;
      final length = _playerController.value.duration.inSeconds;

      /// If buffering but then video starts playing, reset buffering to false
      if (isPlaying) {
        ref.read(isBufferingProvider(widget.url ?? '').notifier).state = false;
      } else {
        ref.read(isBufferingProvider(widget.url ?? '').notifier).state = isBuffering;
      }

      /// If seeking completes, reset buffering state
      if (!isBuffering && position.inMilliseconds > 0) {
        ref.read(isBufferingProvider(widget.url ?? '').notifier).state = false;
      }

      ref.read(isPlayingProvider(widget.url ?? '').notifier).state = isPlaying;

      // Position update for progress bar
      ref.read(videoPositionProvider(widget.url ?? '').notifier).state = position;
    });

    _chewieController = ChewieController(
      videoPlayerController: _playerController,
      aspectRatio: 16 / 9,
      allowedScreenSleep: false,
      allowFullScreen: true,
      bufferingBuilder: (context) {
        return const SizedBox();
      },
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      deviceOrientationsOnEnterFullScreen: [DeviceOrientation.landscapeLeft],
      isLive: false,
      showControlsOnInitialize: false,
      autoInitialize: true,
      customControls: const SizedBox(),
      autoPlay: false,
    );

    /// mark provider as video controller has initialized
    ref.read(playerControllerInitialized(widget.url ?? '').notifier).state = true;
  }

  void _togglePlayPause() {
    if (_playerController.value.isPlaying) {
      _playerController.pause();
    } else {
      _playerController.play();
    }
    _resetHideControlsTimer();
  }

  void _seekBy(Duration offset) {
    final newPosition = _playerController.value.position + offset;
    _playerController.seekTo(newPosition);
    _resetHideControlsTimer();
  }

  void _toggleMute() {
    final isMuted = ref.read(isMutedProvider(widget.url ?? ''));
    _playerController.setVolume(isMuted ? 1.0 : 0.0);
    ref.read(isMutedProvider(widget.url ?? '').notifier).state = !isMuted;
    _resetHideControlsTimer();
  }

  void _toggleFullScreen() {
    final isFullScreen = ref.read(isFullScreenProvider(widget.url ?? ''));
    if (isFullScreen) {
      _chewieController?.exitFullScreen();
      // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    } else {
      _chewieController?.enterFullScreen();
      // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    }
    ref.read(isFullScreenProvider(widget.url ?? '').notifier).state = !isFullScreen;
    _resetHideControlsTimer();
  }

  void _onTapOverlay() {
    setState(() {
      _showControls = !_showControls;
    });
    _resetHideControlsTimer();
  }

  void _resetHideControlsTimer() {
    _hideControlsTimer?.cancel();
    if (_showControls) {
      _hideControlsTimer = Timer(const Duration(seconds: 3), () {
        setState(() {
          _showControls = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isBuffering = ref.watch(isBufferingProvider(widget.url ?? ''));
    final isPlaying = ref.watch(isPlayingProvider(widget.url ?? ''));
    final isMuted = ref.watch(isMutedProvider(widget.url ?? ''));
    final position = ref.watch(videoPositionProvider(widget.url ?? ''));
    final duration = ref.watch(videoDurationProvider(widget.url ?? ''));

    if (widget.url == null) {
      return const Center(
        child: Text('No video found.'),
      );
    }
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Consumer(builder: (context, ref, _) {
        final videoControllerInitialized = ref.watch(playerControllerInitialized(widget.url ?? ''));
        if (videoControllerInitialized == false) {
          return const Center(
            child: SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(color: AppColors.red),
            ),
          );
        }
        return GestureDetector(
          onTap: _onTapOverlay,
          child: Stack(
            children: [
              Chewie(
                controller: _chewieController!,
              ),

              // Custom buffering indicator
              if (isBuffering) const Center(child: CircularProgressIndicator()),

              // Play/Pause Button & Controls (Auto-hides)
              if (_showControls) ...[
                Container(color: Colors.black38), // Overlay
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.replay_10, color: Colors.white, size: 32),
                          onPressed: () => _seekBy(const Duration(seconds: -10)),
                        ),
                        IconButton(
                          icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 48),
                          onPressed: _togglePlayPause,
                        ),
                        IconButton(
                          icon: const Icon(Icons.forward_10, color: Colors.white, size: 32),
                          onPressed: () => _seekBy(const Duration(seconds: 10)),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  right: 20,
                  child: IconButton(
                    icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up, color: Colors.white),
                    onPressed: _toggleMute,
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(Icons.fullscreen, color: Colors.white),
                    onPressed: _toggleFullScreen,
                  ),
                ),
              ],

              // Progress Bar at Bottom (Draggable)
              Positioned(
                bottom: 0,
                left: 8,
                right: 8,
                child: SliderTheme(
                  data: const SliderThemeData(
                    trackHeight: 2,
                    padding: EdgeInsets.zero,
                    thumbSize: WidgetStatePropertyAll(Size(2, 2)),
                  ),
                  child: Slider(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppValues.paddingSmall,
                    ),
                    min: 0,
                    max: duration.inMilliseconds.toDouble(),
                    value: position.inMilliseconds.toDouble().clamp(0, duration.inMilliseconds.toDouble()),
                    onChanged: (value) {
                      final newPosition = Duration(milliseconds: value.toInt());
                      _playerController.seekTo(newPosition);
                      ref.read(videoPositionProvider(widget.url ?? '').notifier).state = newPosition;
                      _resetHideControlsTimer();
                    },
                    activeColor: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
