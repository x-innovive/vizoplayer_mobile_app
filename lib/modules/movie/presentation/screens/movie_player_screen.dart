import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/appbars/app_app_bar.dart';
import '../../../../core/widgets/utility/invalid_data_widget.dart';
import '../../business/entity/movie.dart';
import '../widgets/movie_video_player.dart';

class MoviePlayerScreen extends ConsumerStatefulWidget {
  final Movie? movie;

  const MoviePlayerScreen({super.key, required this.movie});

  @override
  ConsumerState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MoviePlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: ''),
      body: widget.movie == null
          ? const InvalidDataWidget(message: 'Invalid data')
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieVideoPlayer(url: widget.movie?.url),
                ],
              ),
            ),
    );
  }
}
