import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MovieVideoPlayer extends StatefulWidget {
  final String? url;

  const MovieVideoPlayer({super.key, required this.url});

  @override
  State<MovieVideoPlayer> createState() => _MovieVideoPlayerState();
}

class _MovieVideoPlayerState extends State<MovieVideoPlayer> {
  late final VideoPlayerController playerController;
  late final ChewieController chewieController;

  @override
  void initState() {
    playerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.url ?? ''),
    );
    chewieController = ChewieController(
      videoPlayerController: playerController,
      aspectRatio: 16 / 9,
      allowedScreenSleep: false,
      allowFullScreen: true,
      bufferingBuilder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    playerController.dispose();
    chewieController.dispose();

    super.dispose();
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
      child: Chewie(
        controller: chewieController,
      ),
    );
  }
}
