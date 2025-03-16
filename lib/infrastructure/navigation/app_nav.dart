import 'package:flutter/material.dart';
import '../../modules/servers/business/entity/server.dart';
import '../../modules/servers/presentation/screens/add_server_screen.dart';
import '../../modules/servers/presentation/screens/edit_server_screen.dart';
import 'route_names.dart';
import '../../modules/get_started/presentation/screens/get_started_screen.dart';
import '../../modules/get_started/presentation/screens/nowhere_screen.dart';
import '../../modules/get_started/presentation/screens/splash_sscreen.dart';
import 'package:vizoplayer/modules/github_users/presentation/screens/github_users_screen.dart';
import 'package:go_router/go_router.dart';
import '../../modules/servers/presentation/screens/server_list_screen.dart';
import '../../modules/sign_in/presentation/screens/sign_in_screen.dart';

class AppNav {
  AppNav._();

  /// This field hold the state of [Navigator] widget
  /// which manage a stack of pages in the application
  ///
  /// This field will give the power to access of the
  /// application navigation outside of a context scope
  static final navKey = GlobalKey<NavigatorState>();

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
    initialLocation: RouteNames.splashScreen,
    routes: [
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
    ],
  );
}
