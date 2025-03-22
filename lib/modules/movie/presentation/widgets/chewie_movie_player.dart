import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/resources/app_colors.dart';

final playerControllerInitialized = StateProvider.autoDispose((ref) => false);
final chewieBuffering = StateProvider((ref) => false);

class ChewieMoviePlayer extends ConsumerStatefulWidget {
  final String? url;

  const ChewieMoviePlayer({super.key, required this.url});

  @override
  ConsumerState<ChewieMoviePlayer> createState() => _MovieVideoPlayerState();
}

class _MovieVideoPlayerState extends ConsumerState<ChewieMoviePlayer> {
  late final VideoPlayerController _playerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    _initializePlayer();

    super.initState();
  }

  @override
  void dispose() {
    _playerController.dispose();
    _chewieController?.dispose();

    super.dispose();
  }

  Future<void> _initializePlayer() async {
    _playerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.url ?? ''),
    );
    await _playerController.initialize();
    _playerController.addListener(() {
      if (_playerController.value.isBuffering) {
        ref.read(chewieBuffering.notifier).state = true;
      } else {
        /// here not geeting the callback
        ref.read(chewieBuffering.notifier).state = false;
      }
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
    );

    /// mark provider as video controller has initialized
    ref.read(playerControllerInitialized.notifier).state = true;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.url == null) {
      return const Center(
        child: Text('No video found.'),
      );
    }
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Consumer(
        builder: (context, ref, _) {
          final videoControllerInitialized = ref.watch(playerControllerInitialized);
          if (videoControllerInitialized == false) {
            return const Center(child: CircularProgressIndicator(color: AppColors.subtitleColor));
          }
          return Stack(
            children: [
              Chewie(
                controller: _chewieController!,
              ),
              Positioned(
                top: 0, bottom: 0, right: 0, left: 0,
                child: Consumer(
                  builder: (context, ref, _) {
                    final videoBuffering = ref.watch(chewieBuffering);
                    if (videoBuffering) {
                      return const CircularProgressIndicator(color: AppColors.subtitleColor);
                    }
                    return const SizedBox();
                  }
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
