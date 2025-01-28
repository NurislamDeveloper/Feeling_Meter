import 'package:feeling_metter/screen/view/calender.dart';
import 'package:feeling_metter/screen/view/mood_diary_screen.dart';
import 'package:feeling_metter/screen/view/my_home_page.dart';
import 'package:feeling_metter/viewmodels/statistics_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const MyHomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'calendar',
            builder: (BuildContext context, GoRouterState state) {
              return const CalendarPage(); // Fixed here: removed extra parentheses
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'mood',
                builder: (BuildContext context, GoRouterState state) {
                  return const MoodDiaryScreen(); // Fixed here: removed extra parentheses
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'statistics',
                    builder: (BuildContext context, GoRouterState state) {
                      return const StatisticsScreen(); // Fixed here: removed extra parentheses
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
    // Create a getter to access the router
  GoRouter get router => _router;

}
