import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../modules/audio/presentation/screens/audio_album_screen.dart';
import '../../modules/favourite/presentation/screens/favourite_screen.dart';
import '../../modules/fire/presentation/screens/fire_screen.dart';
import '../../modules/get_started/presentation/screens/get_started_screen.dart';
import '../../modules/get_started/presentation/screens/nowhere_screen.dart';
import '../../modules/get_started/presentation/screens/splash_sscreen.dart';
import '../../modules/home/presentation/screens/home_screen.dart';
import '../../modules/home/presentation/screens/home_with_bottom_nav.dart';
import '../../modules/live_tv/presentation/screens/live_tv_detail_screen.dart';
import '../../modules/live_tv/presentation/screens/live_tv_screen.dart';
import '../../modules/movie/business/entity/movie.dart';
import '../../modules/movie/presentation/screens/movie_detail_screen.dart';
import '../../modules/movie/presentation/screens/movies_screen.dart';
import '../../modules/profile/presentation/screens/profile_screen.dart';
import '../../modules/servers/business/entity/server.dart';
import '../../modules/servers/presentation/screens/add_server_screen.dart';
import '../../modules/servers/presentation/screens/edit_server_screen.dart';
import '../../modules/servers/presentation/screens/server_list_screen.dart';
import '../../modules/sign_in/presentation/screens/deactivated_account_screen.dart';
import '../../modules/sign_in/presentation/screens/sign_in_screen.dart';
import '../../modules/tv_shows/presentation/screens/tv_show_detail_screen.dart';
import '../../modules/tv_shows/presentation/screens/tv_shows_screen.dart';
import 'app_transition.dart';
import 'route_names.dart';

class AppNav {
  AppNav._();

  /// This field hold the state of root [Navigator] widget
  /// which manage a stack of pages in the application
  ///
  /// This field will give the power to access of the
  /// application navigation outside of a context scope
  static final navKey = GlobalKey<NavigatorState>();

  static final shellNavKey = GlobalKey<NavigatorState>();

  /// This key is used to access the state of the ScaffoldMessenger
  /// widget, which provides the functionality to show snack bars,
  /// banners, and other persistent UI elements.
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  /// THis method return a instance of [PageRouteBuilder]
  /// main purpose of this method is to give a fade in
  /// animation transition when navigating from one
  /// screen to another screen
  // static Route<dynamic> generateRoutes(RouteSettings settings) {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) {
  //       return _getScreenByName(settings.name, settings.arguments);
  //     },
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       // const begin = Offset(0.0, 1.0);
  //       // const end = Offset.zero;
  //       // final tween = Tween(begin: begin, end: end);
  //       // final offsetAnimation = animation.drive(tween);
  //       return FadeTransition(
  //         alwaysIncludeSemantics: true,
  //         opacity: animation,
  //         child: child,
  //       );
  //     },
  //   );
  // }

  /// This method return a widget that represent a single screen
  // static Widget _getScreenByName(String? name, Object? arguments) {
  //   switch (name) {
  //     case RouteNames.splashScreen:
  //       return Container();
  //     // case RouteNames.githubUsersScreen:
  //     //   return const GithubUsersScreen();
  //     default:
  //       return Container();
  //   }
  // }

  /// Function to make possible page transition while navigation
  static CustomTransitionPage<T> buildPageWithTransition<T>({
    required GoRouterState state,
    required Widget child,
    AppTransition transition = AppTransition.fade,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(parent: animation, curve: curve);

        switch (transition) {
          case AppTransition.slideFromBottom:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(curved),
              child: child,
            );

          case AppTransition.slideFromTop:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -1),
                end: Offset.zero,
              ).animate(curved),
              child: child,
            );

          case AppTransition.slideFromLeft:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(curved),
              child: child,
            );

          case AppTransition.slideFromRight:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(curved),
              child: child,
            );

          case AppTransition.scale:
            return ScaleTransition(
              scale: Tween<double>(begin: 0.9, end: 1.0).animate(curved),
              child: child,
            );

          case AppTransition.rotation:
            return RotationTransition(
              turns: Tween<double>(begin: 0.9, end: 1.0).animate(curved),
              child: child,
            );

          case AppTransition.fadeScale:
            return FadeTransition(
              opacity: curved,
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.95, end: 1.0).animate(curved),
                child: child,
              ),
            );

          case AppTransition.fade:
            return FadeTransition(
              opacity: curved,
              child: child,
            );
        }
      },
    );
  }

  static final goRouter = GoRouter(
    navigatorKey: navKey,
    initialLocation: RouteNames.homeScreen,
    routes: [
      ..._authRoutes,
      ..._mainRoutes,
    ],
  );

  static final _authRoutes = [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => buildPageWithTransition(
        state: state,
        child: const NowhereScreen(),
      ),
    ),
    GoRoute(
      path: RouteNames.splashScreen,
      pageBuilder: (context, state) => buildPageWithTransition(
        state: state,
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      path: RouteNames.getStartedScreen,
      pageBuilder: (context, state) => buildPageWithTransition(
        state: state,
        child: const GetStartedScreen(),
      ),
    ),
    GoRoute(
      path: RouteNames.signInScreen,
      pageBuilder: (context, state) => buildPageWithTransition(
        state: state,
        child: const SignInScreen(),
      ),
    ),
    GoRoute(
      path: RouteNames.serverListScreen,
      pageBuilder: (context, state) => buildPageWithTransition(
        state: state,
        child: const ServerListScreen(),
      ),
    ),
    GoRoute(
      path: RouteNames.addServerScreen,
      pageBuilder: (context, state) => buildPageWithTransition(
        state: state,
        child: const AddServerScreen(),
      ),
    ),
    GoRoute(
      path: RouteNames.editServerScreen,
      pageBuilder: (context, state) {
        final server = state.extra as Server;
        return buildPageWithTransition(
          state: state,
          child: EditServerScreen(server: server),
        );
      },
    ),
    GoRoute(
      path: RouteNames.deactivatedAccountScreen,
      pageBuilder: (context, state) => buildPageWithTransition(
        state: state,
        child: const DeactivatedAccountScreen(),
      ),
    ),
  ];

  static final _mainRoutes = [
    ShellRoute(
      navigatorKey: shellNavKey,
      builder: (context, state, child) {
        return HomeWithBottomNav(child: child);
      },
      routes: [
        GoRoute(
          path: RouteNames.homeScreen,
          pageBuilder: (context, state) => buildPageWithTransition(
            state: state,
            child: const HomeScreen(),
          ),
          routes: _homeNestedRoutes,
        ),
        GoRoute(
          path: RouteNames.fireScreen,
          // name: 'home',
          pageBuilder: (context, state) => buildPageWithTransition(
            state: state,
            child: const FireScreen(),
          ),
        ),
        GoRoute(
          path: RouteNames.favouriteScreen,
          // name: 'favourite',
          pageBuilder: (context, state) => buildPageWithTransition(
            state: state,
            child: const FavouriteScreen(),
          ),
        ),
        GoRoute(
          path: RouteNames.profileScreen,
          // name: 'profile',
          pageBuilder: (context, state) => buildPageWithTransition(
            state: state,
            child: const ProfileScreen(),
          ),
        ),
      ],
    ),
  ];

  static final _homeNestedRoutes = [
    GoRoute(
      path: RouteNames.moviesScreen,
      pageBuilder: (context, state) => buildPageWithTransition(
        state: state,
        child: MoviesScreen(title: state.extra as String),
      ),
    ),
    GoRoute(
      path: RouteNames.movieDetailScreen,
      pageBuilder: (context, state) => buildPageWithTransition(
        state: state,
        child: MovieDetailScreen(movie: state.extra as Movie?),
      ),
    ),
    GoRoute(
      path: RouteNames.tvShowsScreen,
      pageBuilder: (context, state) => buildPageWithTransition(
        state: state,
        child: const TvShowsScreen(),
      ),
    ),
    GoRoute(
      path: RouteNames.tvShowsDetailScreen,
      pageBuilder: (context, state) => buildPageWithTransition(
        state: state,
        child: TvShowDetailScreen(movie: state.extra as Movie?),
      ),
    ),
    GoRoute(
      path: RouteNames.liveTvScreen,
      pageBuilder: (context, state) => buildPageWithTransition(
        state: state,
        child: const LiveTvScreen(),
      ),
    ),
    GoRoute(
      path: RouteNames.liveTvDetailScreen,
      pageBuilder: (context, state) => buildPageWithTransition(
        state: state,
        child: const LiveTvDetailsScreen(),
      ),
    ),
    GoRoute(
      path: RouteNames.audioAlbumScreen,
      pageBuilder: (context, state) => buildPageWithTransition(
        state: state,
        child: const AudioAlbumScreen(),
      ),
    ),
    GoRoute(
      path: RouteNames.audioAlbumDetailScreen,
      pageBuilder: (context, state) => buildPageWithTransition(
        state: state,
        child: const AudioAlbumScreen(),
      ),
    ),
  ];
}
