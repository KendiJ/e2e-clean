
import 'package:auto_route/auto_route.dart';
// import 'package:epam_test/main.dart';
import 'package:flutter/material.dart';

import '../../presentation/views/breaking_news.dart';

part 'app_router.gr.dart';


@AdaptiveAutoRouter(
  routes: [
    // AutoRoute(page: MyHomePage, initial: true),
    AutoRoute(page: BreakingNewsPage),
    // AutoRoute(page: ArticlesPage),
    // AutoRoute(page: SavedArticlePage),

  ]
)

class AppRouter extends _$AppRouter {}

// Path: lib/src/config/router/app_router.gr.dart

final appRouter = AppRouter();