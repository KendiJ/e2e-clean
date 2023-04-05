// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    BreakingNewsPageRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const BreakingNewsPage(),
      );
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          BreakingNewsPageRoute.name,
          path: '/breaking-news-page',
        )
      ];
}

/// generated route for
/// [BreakingNewsPage]
class BreakingNewsPageRoute extends PageRouteInfo<void> {
  const BreakingNewsPageRoute()
      : super(
          BreakingNewsPageRoute.name,
          path: '/breaking-news-page',
        );

  static const String name = 'BreakingNewsPageRoute';
}
