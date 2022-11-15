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
    InitRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: InitPage(),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: MainPage(args.patternTypes),
      );
    },
    CategoryRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: CategoryPage(designPatternType: args.designPatternType),
      );
    },
    FavoriteRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: FavoritePage(),
      );
    },
    LanguageRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: LanguagePage(),
      );
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: DetailsPage(
          designPattern: args.designPattern,
          innerWidget: args.innerWidget,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          InitRoute.name,
          path: '/',
        ),
        RouteConfig(
          MainRoute.name,
          path: '/main-page',
        ),
        RouteConfig(
          CategoryRoute.name,
          path: '/category-page',
        ),
        RouteConfig(
          FavoriteRoute.name,
          path: '/favorite-page',
        ),
        RouteConfig(
          LanguageRoute.name,
          path: '/language-page',
        ),
        RouteConfig(
          DetailsRoute.name,
          path: '/details-page',
        ),
      ];
}

/// generated route for
/// [InitPage]
class InitRoute extends PageRouteInfo<void> {
  const InitRoute()
      : super(
          InitRoute.name,
          path: '/',
        );

  static const String name = 'InitRoute';
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<MainRouteArgs> {
  MainRoute({required List<DesignPatternType> patternTypes})
      : super(
          MainRoute.name,
          path: '/main-page',
          args: MainRouteArgs(patternTypes: patternTypes),
        );

  static const String name = 'MainRoute';
}

class MainRouteArgs {
  const MainRouteArgs({required this.patternTypes});

  final List<DesignPatternType> patternTypes;

  @override
  String toString() {
    return 'MainRouteArgs{patternTypes: $patternTypes}';
  }
}

/// generated route for
/// [CategoryPage]
class CategoryRoute extends PageRouteInfo<CategoryRouteArgs> {
  CategoryRoute({required DesignPatternType designPatternType})
      : super(
          CategoryRoute.name,
          path: '/category-page',
          args: CategoryRouteArgs(designPatternType: designPatternType),
        );

  static const String name = 'CategoryRoute';
}

class CategoryRouteArgs {
  const CategoryRouteArgs({required this.designPatternType});

  final DesignPatternType designPatternType;

  @override
  String toString() {
    return 'CategoryRouteArgs{designPatternType: $designPatternType}';
  }
}

/// generated route for
/// [FavoritePage]
class FavoriteRoute extends PageRouteInfo<void> {
  const FavoriteRoute()
      : super(
          FavoriteRoute.name,
          path: '/favorite-page',
        );

  static const String name = 'FavoriteRoute';
}

/// generated route for
/// [LanguagePage]
class LanguageRoute extends PageRouteInfo<void> {
  const LanguageRoute()
      : super(
          LanguageRoute.name,
          path: '/language-page',
        );

  static const String name = 'LanguageRoute';
}

/// generated route for
/// [DetailsPage]
class DetailsRoute extends PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    required DesignPattern designPattern,
    required Widget innerWidget,
  }) : super(
          DetailsRoute.name,
          path: '/details-page',
          args: DetailsRouteArgs(
            designPattern: designPattern,
            innerWidget: innerWidget,
          ),
        );

  static const String name = 'DetailsRoute';
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    required this.designPattern,
    required this.innerWidget,
  });

  final DesignPattern designPattern;

  final Widget innerWidget;

  @override
  String toString() {
    return 'DetailsRouteArgs{designPattern: $designPattern, innerWidget: $innerWidget}';
  }
}
