import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/dummys/dummy_datas.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/appbars/app_app_bar.dart';
import '../../../../core/widgets/dividers/primary_divider.dart';
import '../../../../core/widgets/media_lists_views/movie_grid_view.dart';
import '../../../../core/widgets/utility/invalid_data_widget.dart';
import '../../../movie/business/entity/movie.dart';
import '../../../movie/presentation/widgets/chewie_movie_player.dart';
import '../../../movie/presentation/widgets/movie_description_widget.dart';
import '../providers/tv_shows_providers.dart';
import 'tv_show_episodes_page.dart';
import 'tv_show_more_like_this_page.dart';

class TvShowDetailScreen extends ConsumerStatefulWidget {
  final Movie? movie;

  const TvShowDetailScreen({super.key, required this.movie});

  @override
  ConsumerState createState() => _TvShowDetailScreenState();
}

class _TvShowDetailScreenState extends ConsumerState<TvShowDetailScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final PageController _pageController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, keepPage: true);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: ''),
      body: widget.movie == null
          ? const InvalidDataWidget(message: 'Invalid data')
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChewieMoviePlayer(url: widget.movie?.url),
                // MoviePlayer(url: widget.movie?.url ?? ''),
                const SizedBox(height: AppValues.paddingNormal),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppValues.paddingNormal),
                          child: MovieDescriptionWidget(
                            onPlay: () {},
                            onFav: () {},
                            onLike: () {},
                            isTvShow: true,
                          ),
                        ),
                        const SizedBox(height: AppValues.paddingNormal),
                        const PrimaryDivider(),
                        TabBar(
                          controller: _tabController,
                          indicatorWeight: 0,
                          indicator: const BoxDecoration(),
                          labelColor: Colors.white,
                          unselectedLabelColor: const Color(0xFFFBFFFF),
                          labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                          unselectedLabelStyle: const TextStyle(),
                          dividerColor: Colors.transparent,
                          indicatorSize: TabBarIndicatorSize.label,
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          onTap: (tab) {
                            ref.read(tabIndexProvider.notifier).state = tab;
                          },
                          tabs: const [
                            Tab(
                              text: "Episodes",
                            ),
                            Tab(
                              text: 'More Like This',
                            ),
                          ],
                        ),
                        const PrimaryDivider(),
                        Consumer(
                          builder: (context, ref, _) {
                            final index = ref.watch(tabIndexProvider);
                            switch (index) {
                              case 0:
                                return const TvShowEpisodesPage();
                              case 1:
                                return const TvShowMoreLikeThisPage();
                            }

                            return Container();
                          },
                        ),
                        const SizedBox(height: AppValues.paddingLarge),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
