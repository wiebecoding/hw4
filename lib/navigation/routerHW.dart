import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hw4/auth_bloc/auth_bloc.dart';
import 'package:hw4/pages/author_detail_page.dart';
import 'package:hw4/pages/author_page.dart';
import 'package:hw4/pages/home_page.dart';
import 'package:hw4/pages/login_page.dart';
import 'package:hw4/pages/profile_page.dart';
import 'package:hw4/pages/title_detail_page.dart';
import 'package:hw4/pages/title_page.dart';
import 'package:hw4/utils/stream_to_listenable.dart';
import 'package:hw4/widgets/scaffold_with_navbar.dart';

class RouteName {
  static const home = "home";
  static const login = "login";
  static const byAuthor = "byAuthor";
  static const byTitle = "byTitle";
  static const profile = "profile";
  static const byAuthorDetail = "byAuthorDetail";
  static const byTitleDetail = "byTitleDetail";
}

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: "Root",
);
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: "Shell",
);

GoRouter routerHW(AuthenticationBloc authenticationBloc) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: "/login",
    refreshListenable: StreamToListenable([authenticationBloc.stream]),
    redirect: (context, state) async {
      if (authenticationBloc.state is AuthenticationLoggedIn &&
          ((state.fullPath?.startsWith("/login") ?? false))) {
        return "/byAuthor";
      } else {
        if (!(state.fullPath?.startsWith("/login") ?? false) &&
            authenticationBloc.state is AuthenticationLoggedOut) {
          return "/login";
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: RouteName.home,
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: '/',
        name: RouteName.login,
        builder: (context, state) {
          return const HomePage();
        },
        routes: [
          ShellRoute(
            navigatorKey: shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state, Widget child) {
              return ScaffoldWithNavBar(child: child);
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'byAuthor',
                name: RouteName.byAuthor,
                builder: (BuildContext context, GoRouterState state) {
                  return const AuthorPage();
                },
                routes: [
                  GoRoute(
                    path: 'detail',
                    name: RouteName.byAuthorDetail,
                    builder: (BuildContext context, GoRouterState state) {
                      return const AuthorDetailPage();
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'byTitle',
                name: RouteName.byTitle,
                builder: (BuildContext context, GoRouterState state) {
                  return const TitlePage();
                },
                routes: [
                  GoRoute(
                    path: 'detail',
                    name: RouteName.byTitleDetail,
                    builder: (BuildContext context, GoRouterState state) {
                      return const TitleDetailPage();
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'profile',
                name: RouteName.profile,
                builder: (BuildContext context, GoRouterState state) {
                  return const ProfilePage();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
