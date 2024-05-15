import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travelapp/apps/router/router_name.dart';
import 'package:travelapp/home_main.dart';
import 'package:travelapp/auth/main_page.dart';
import 'package:travelapp/models/data_location.dart';
import 'package:travelapp/screen/favorite_screen.dart';
import 'package:travelapp/screen/notification_screen.dart';
import 'package:travelapp/screen/post_location_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RouterCustom {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: RouterName.login,
        builder: (BuildContext context, GoRouterState state) {
          return const MainPage();
        },
      ),
      GoRoute(
        path: '/homepage',
        name: RouterName.homepage,
        builder: (BuildContext context, GoRouterState state) {
          return HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'postlocation',
            name: RouterName.postlocation,
            builder: (BuildContext context, GoRouterState state) {
              Location item = state.extra as Location;
              return PostScreen(item: item);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/favotite',
        name: RouterName.favorite,
        builder: (BuildContext context, GoRouterState state) {
          Location item = state.extra as Location;
          return FavorieScreen(item: item);
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'likepost',
            name: RouterName.likepost,
            builder: (BuildContext context, GoRouterState state) {
              Location item = state.extra as Location;
              return PostScreen(item: item);
            },
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: navigatorKey,
        path: '/notification',
        name: RouterName.notification,
        builder: (BuildContext context, GoRouterState state) {
          return const NotificationScreenn();
        },
      ),
    ],
  );
}
