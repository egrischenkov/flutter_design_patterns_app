// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:flutter_design_patterns/entity/design_pattern.dart' as _i10;
import 'package:flutter_design_patterns/entity/design_pattern_type.dart' as _i9;
import 'package:flutter_design_patterns/ui/pages/category_page.dart' as _i3;
import 'package:flutter_design_patterns/ui/pages/details_page.dart' as _i6;
import 'package:flutter_design_patterns/ui/pages/favorite_page.dart' as _i4;
import 'package:flutter_design_patterns/ui/pages/init_page.dart' as _i1;
import 'package:flutter_design_patterns/ui/pages/language_page.dart' as _i5;
import 'package:flutter_design_patterns/ui/pages/main_page.dart' as _i2;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    InitRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.InitPage(),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.MainPage(args.patternTypes),
      );
    },
    CategoryRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryRouteArgs>();
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.CategoryPage(designPatternType: args.designPatternType),
      );
    },
    FavoriteRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i4.FavoritePage(),
      );
    },
    LanguageRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i5.LanguagePage(),
      );
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i6.DetailsPage(
          designPattern: args.designPattern,
          innerWidget: args.innerWidget,
        ),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          InitRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          MainRoute.name,
          path: '/main-page',
        ),
        _i7.RouteConfig(
          CategoryRoute.name,
          path: '/category-page',
        ),
        _i7.RouteConfig(
          FavoriteRoute.name,
          path: '/favorite-page',
        ),
        _i7.RouteConfig(
          LanguageRoute.name,
          path: '/language-page',
        ),
        _i7.RouteConfig(
          DetailsRoute.name,
          path: '/details-page',
        ),
      ];
}

/// generated route for
/// [_i1.InitPage]
class InitRoute extends _i7.PageRouteInfo<void> {
  const InitRoute()
      : super(
          InitRoute.name,
          path: '/',
        );

  static const String name = 'InitRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i7.PageRouteInfo<MainRouteArgs> {
  MainRoute({required List<_i9.DesignPatternType> patternTypes})
      : super(
          MainRoute.name,
          path: '/main-page',
          args: MainRouteArgs(patternTypes: patternTypes),
        );

  static const String name = 'MainRoute';
}

class MainRouteArgs {
  const MainRouteArgs({required this.patternTypes});

  final List<_i9.DesignPatternType> patternTypes;

  @override
  String toString() {
    return 'MainRouteArgs{patternTypes: $patternTypes}';
  }
}

/// generated route for
/// [_i3.CategoryPage]
class CategoryRoute extends _i7.PageRouteInfo<CategoryRouteArgs> {
  CategoryRoute({required _i9.DesignPatternType designPatternType})
      : super(
          CategoryRoute.name,
          path: '/category-page',
          args: CategoryRouteArgs(designPatternType: designPatternType),
        );

  static const String name = 'CategoryRoute';
}

class CategoryRouteArgs {
  const CategoryRouteArgs({required this.designPatternType});

  final _i9.DesignPatternType designPatternType;

  @override
  String toString() {
    return 'CategoryRouteArgs{designPatternType: $designPatternType}';
  }
}

/// generated route for
/// [_i4.FavoritePage]
class FavoriteRoute extends _i7.PageRouteInfo<void> {
  const FavoriteRoute()
      : super(
          FavoriteRoute.name,
          path: '/favorite-page',
        );

  static const String name = 'FavoriteRoute';
}

/// generated route for
/// [_i5.LanguagePage]
class LanguageRoute extends _i7.PageRouteInfo<void> {
  const LanguageRoute()
      : super(
          LanguageRoute.name,
          path: '/language-page',
        );

  static const String name = 'LanguageRoute';
}

/// generated route for
/// [_i6.DetailsPage]
class DetailsRoute extends _i7.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    required _i10.DesignPattern designPattern,
    required _i8.Widget innerWidget,
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

  final _i10.DesignPattern designPattern;

  final _i8.Widget innerWidget;

  @override
  String toString() {
    return 'DetailsRouteArgs{designPattern: $designPattern, innerWidget: $innerWidget}';
  }
}
