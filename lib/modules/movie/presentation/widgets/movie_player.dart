import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

// Providers for state management
final isPlayingProvider = StateProvider<bool>((ref) => false);
final isBufferingProvider = StateProvider<bool>((ref) => false);
final isMutedProvider = StateProvider<bool>((ref) => false);
final isFullScreenProvider = StateProvider<bool>((ref) => false);
final videoPositionProvider = StateProvider<Duration>((ref) => Duration.zero);
final videoDurationProvider = StateProvider<Duration>((ref) => Duration.zero);

class MoviePlayer extends ConsumerStatefulWidget {
  final String url;
  const MoviePlayer({super.key, required this.url});

  @override
  ConsumerState<MoviePlayer> createState() => _MovieVideoPlayerState();
}

class _MovieVideoPlayerState extends ConsumerState<MoviePlayer> {
  late VideoPlayerController _controller;
  bool _showControls = true;
  Timer? _hideControlsTimer;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url));
    await _controller.initialize();
    ref.read(videoDurationProvider.notifier).state = _controller.value.duration;

    _controller.addListener(() {
      final isBuffering = _controller.value.isBuffering;
      final isPlaying = _controller.value.isPlaying;
      final position = _controller.value.position;
      final currentPosition = _controller.value.position.inSeconds;
      final length = _controller.value.duration.inSeconds;

      /// If buffering but then video starts playing, reset buffering to false
      if (isBuffering && isPlaying) {
        ref.read(isBufferingProvider.notifier).state = false;
      } else {
        ref.read(isBufferingProvider.notifier).state = isBuffering;
      }

      /// If seeking completes, reset buffering state
      if (!isBuffering && position.inMilliseconds > 0) {
        ref.read(isBufferingProvider.notifier).state = false;
      }

      ref.read(isPlayingProvider.notifier).state = isPlaying;

      // Position update for progress bar
      ref.read(videoPositionProvider.notifier).state = position;
    });

    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    _hideControlsTimer?.cancel();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    _resetHideControlsTimer();
  }

  void _seekBy(Duration offset) {
    final newPosition = _controller.value.position + offset;
    _controller.seekTo(newPosition);
    _resetHideControlsTimer();
  }

  void _toggleMute() {
    final isMuted = ref.read(isMutedProvider);
    _controller.setVolume(isMuted ? 1.0 : 0.0);
    ref.read(isMutedProvider.notifier).state = !isMuted;
    _resetHideControlsTimer();
  }

  void _toggleFullScreen() {
    final isFullScreen = ref.read(isFullScreenProvider);
    if (isFullScreen) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    }
    ref.read(isFullScreenProvider.notifier).state = !isFullScreen;
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
    final isBuffering = ref.watch(isBufferingProvider);
    final isPlaying = ref.watch(isPlayingProvider);
    final isMuted = ref.watch(isMutedProvider);
    final position = ref.watch(videoPositionProvider);
    final duration = ref.watch(videoDurationProvider);

    return GestureDetector(
      onTap: _onTapOverlay,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: VideoPlayer(_controller),
          ),

          // Custom buffering indicator
          if (isBuffering) const Center(child: CircularProgressIndicator()),

          // Play/Pause Button & Controls (Auto-hides)
          if (_showControls) ...[
            Container(color: Colors.black38), // Overlay
            Row(
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
                icon: Icon(Icons.fullscreen, color: Colors.white),
                onPressed: _toggleFullScreen,
              ),
            ),
          ],

          // Progress Bar at Bottom (Draggable)
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Slider(
              min: 0,
              max: duration.inMilliseconds.toDouble(),
              value: position.inMilliseconds.toDouble().clamp(0, duration.inMilliseconds.toDouble()),
              onChanged: (value) {
                final newPosition = Duration(milliseconds: value.toInt());
                _controller.seekTo(newPosition);
                ref.read(videoPositionProvider.notifier).state = newPosition;
                _resetHideControlsTimer();
              },
              activeColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
