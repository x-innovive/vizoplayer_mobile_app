import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../modules/favourite/presentation/screens/favourite_screen.dart';
import '../../modules/fire/presentation/screens/fire_screen.dart';
import '../../modules/get_started/presentation/screens/get_started_screen.dart';
import '../../modules/get_started/presentation/screens/nowhere_screen.dart';
import '../../modules/get_started/presentation/screens/splash_sscreen.dart';
import '../../modules/movie/business/entity/movie.dart';
import '../../modules/movie/presentation/screens/movies_screen.dart';
import '../../modules/home/presentation/screens/home_screen.dart';
import '../../modules/home/presentation/screens/home_with_bottom_nav.dart';
import '../../modules/movie/presentation/screens/movie_detail_screen.dart';
import '../../modules/profile/presentation/screens/profile_screen.dart';
import '../../modules/servers/business/entity/server.dart';
import '../../modules/servers/presentation/screens/add_server_screen.dart';
import '../../modules/servers/presentation/screens/edit_server_screen.dart';
import '../../modules/servers/presentation/screens/server_list_screen.dart';
import '../../modules/sign_in/presentation/screens/deactivated_account_screen.dart';
import '../../modules/sign_in/presentation/screens/sign_in_screen.dart';
import '../../modules/tv_shows/presentation/screens/tv_show_detail_screen.dart';
import '../../modules/tv_shows/presentation/screens/tv_shows_screen.dart';
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
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return _getScreenByName(settings.name, settings.arguments);
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // const begin = Offset(0.0, 1.0);
        // const end = Offset.zero;
        // final tween = Tween(begin: begin, end: end);
        // final offsetAnimation = animation.drive(tween);
        return FadeTransition(
          alwaysIncludeSemantics: true,
          opacity: animation,
          child: child,
        );
      },
    );
  }

  /// This method return a widget that represent a single screen
  static Widget _getScreenByName(String? name, Object? arguments) {
    switch (name) {
      case RouteNames.splashScreen:
        return Container();
      // case RouteNames.githubUsersScreen:
      //   return const GithubUsersScreen();
      default:
        return Container();
    }
  }

  static final goRouter = GoRouter(
    navigatorKey: navKey,
    initialLocation: RouteNames.homeScreen,
    routes: [
      ..._authRoutes,
      ..._homeRoutes,
    ],
  );

  static final _authRoutes = [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const NowhereScreen();
      },
    ),
    GoRoute(
      path: RouteNames.splashScreen,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: RouteNames.getStartedScreen,
      builder: (context, state) {
        return const GetStartedScreen();
      },
    ),
    GoRoute(
      path: RouteNames.signInScreen,
      builder: (context, state) {
        return const SignInScreen();
      },
    ),
    GoRoute(
      path: RouteNames.serverListScreen,
      builder: (context, state) {
        return const ServerListScreen();
      },
    ),
    GoRoute(
      path: RouteNames.addServerScreen,
      builder: (context, state) {
        return const AddServerScreen();
      },
    ),
    GoRoute(
      path: RouteNames.editServerScreen,
      builder: (context, state) {
        final server = state.extra as Server;
        return EditServerScreen(server: server);
      },
    ),
    GoRoute(
      path: RouteNames.deactivatedAccountScreen,
      builder: (context, state) {
        return const DeactivatedAccountScreen();
      },
    ),
  ];

  static final List<ShellRoute> _homeRoutes = [
    ShellRoute(
      navigatorKey: shellNavKey,
      builder: (context, state, child) {
        return HomeWithBottomNav(child: child);
      },
      routes: [
        GoRoute(
          path: RouteNames.homeScreen,
          // name: 'home',
          builder: (context, state) {
            return const HomeScreen();
          },
          routes: [
            GoRoute(
              path: RouteNames.moviesScreen,
              builder: (context, state) {
                return MoviesScreen(title: state.extra as String);
              },
            ),
            GoRoute(
              path: RouteNames.movieDetailScreen,
              builder: (context, state) {
                return MovieDetailScreen(movie: state.extra as Movie?);
              },
            ),
            GoRoute(
              path: RouteNames.tvShowsScreen,
              builder: (context, state) {
                return const TvShowsScreen();
              },
            ),
            GoRoute(
              path: RouteNames.tvShowsDetailScreen,
              builder: (context, state) {
                return TvShowDetailScreen(movie: state.extra as Movie?);
              },
            ),
          ],
        ),
        GoRoute(
          path: RouteNames.fireScreen,
          // name: 'home',
          builder: (context, state) {
            return const FireScreen();
          },
        ),
        GoRoute(
          path: RouteNames.favouriteScreen,
          // name: 'favourite',
          builder: (context, state) {
            return const FavouriteScreen();
          },
        ),
        GoRoute(
          path: RouteNames.profileScreen,
          // name: 'profile',
          builder: (context, state) {
            return const ProfileScreen();
          },
        ),
      ],
    ),
  ];
}
