import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../entity/design_pattern.dart';
import '../../../entity/design_pattern_type.dart';
import '../../../ui/pages/category_page.dart';
import '../../../ui/pages/details_page.dart';
import '../../../ui/pages/favorite_page.dart';
import '../../../ui/pages/init_page.dart';
import '../../../ui/pages/language_page.dart';
import '../../../ui/pages/main_page.dart';
import '../../../ui/pages/nested_page/nested_pages/first_nested_page.dart';
import '../../../ui/pages/nested_page/nested_pages/second_nested_page.dart';
import '../../../ui/pages/nested_page/nested_pages/third_nested_page.dart';
import '../../../ui/pages/nested_page/nested_route_page.dart';
import '../../../ui/pattern_widgets/abstract_factory/widgets/abstract_factory_pattern_widget.dart';
import '../../../ui/pattern_widgets/adapter/widgets/adapter_pattern_widget.dart';
import '../../../ui/pattern_widgets/bridge/widgets/bridge_pattern_widget.dart';
import '../../../ui/pattern_widgets/builder/builder_widgets/builder_pattern_widget.dart';
import '../../../ui/pattern_widgets/chain_of_responsibility/widgets/chain_of_responsibility_pattern_widget.dart';
import '../../../ui/pattern_widgets/command/widgets/command_pattern_widget.dart';
import '../../../ui/pattern_widgets/composite/composite_pattern_widget.dart';
import '../../../ui/pattern_widgets/decorator/widgets/decorator_pattern_widget.dart';
import '../../../ui/pattern_widgets/facade/widgets/facade_pattern_widget.dart';
import '../../../ui/pattern_widgets/factory_method/widgets/factory_method_pattern_widget.dart';
import '../../../ui/pattern_widgets/flyweight/widgets/flyweight_pattern_widget.dart';
import '../../../ui/pattern_widgets/iterator/widgets/iterator_pattern_widget.dart';
import '../../../ui/pattern_widgets/mediator/widgets/mediator_pattern_widget.dart';
import '../../../ui/pattern_widgets/memento/widgets/memento_pattern_widget.dart';
import '../../../ui/pattern_widgets/observer/widgets/observer_pattern_widget.dart';
import '../../../ui/pattern_widgets/prototype/widgets/prototype_pattern_widget.dart';
import '../../../ui/pattern_widgets/proxy/widgets/proxy_pattern_widget.dart';
import '../../../ui/pattern_widgets/singleton/widgets/singleton_pattern_widget.dart';
import '../../../ui/pattern_widgets/state/widgets/state_pattern_widget.dart';
import '../../../ui/pattern_widgets/strategy/widgets/strategy_pattern_widget.dart';
import '../../../ui/pattern_widgets/template_method/widgets/template_method_pattern_widget.dart';
import '../../../ui/pattern_widgets/visitor/widgets/visitor_pattern_widget.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: InitPage, initial: true),
    AutoRoute(page: MainPage),
    AutoRoute(page: CategoryPage),
    AutoRoute(page: FavoritePage),
    AutoRoute(page: LanguagePage),
    AutoRoute(page: DetailsPage),
    AutoRoute(
      page: NestedRoutePage,
      children: [
        AutoRoute(path: 'first', page: FirstNestedPage),
        AutoRoute(path: 'second', page: SecondNestedPage),
        AutoRoute(path: 'third', page: ThirdNestedPage),
        RedirectRoute(path: '', redirectTo: 'third')
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {
  static Widget patternsWidgetSelector(String patternId) {
    switch (patternId) {
      case _PatternWidgetId.abstractFactory:
        return AbstractFactoryPatternWidget();
      case _PatternWidgetId.adapter:
        return AdapterPatternWidget();
      case _PatternWidgetId.bridge:
        return BridgePatternWidget();
      case _PatternWidgetId.builder:
        return BuilderPatternWidget();
      case _PatternWidgetId.chainOfResponsibility:
        return ChainOfResponsibilityPatternWidget();
      case _PatternWidgetId.command:
        return CommandPatternWidget();
      case _PatternWidgetId.composite:
        return CompositePatternWidget();
      case _PatternWidgetId.decorator:
        return DecoratorPatternWidget();
      case _PatternWidgetId.facade:
        return FacadePatternWidget();
      case _PatternWidgetId.factoryMethod:
        return FactoryMethodPatternWidget();
      case _PatternWidgetId.flyweight:
        return FlyweightPatternWidget();
      case _PatternWidgetId.iterator:
        return IteratorPatternWidget();
      case _PatternWidgetId.mediator:
        return MediatorPatternWidget();
      case _PatternWidgetId.memento:
        return MementoPatternWidget();
      case _PatternWidgetId.observer:
        return ObserverPatternWidget();
      case _PatternWidgetId.prototype:
        return PrototypePatternWidget();
      case _PatternWidgetId.proxy:
        return ProxyPatternWidget();
      case _PatternWidgetId.singleton:
        return SingletonPatternWidget();
      case _PatternWidgetId.state:
        return StatePatternWidget();
      case _PatternWidgetId.strategy:
        return StrategyPatternWidget();
      case _PatternWidgetId.templateMethod:
        return TemplateMethodPatternWidget();
      case _PatternWidgetId.visitor:
        return VisitorPatternWidget();
      default:
        throw Exception('Unknown pattern id: $patternId');
    }
  }
}

class _PatternWidgetId {
  static const String abstractFactory = 'abstract_factory';
  static const String adapter = 'adapter';
  static const String bridge = 'bridge';
  static const String builder = 'builder';
  static const String chainOfResponsibility = '/chain_of_responsibility';
  static const String command = 'command';
  static const String composite = 'composite';
  static const String decorator = 'decorator';
  static const String facade = 'facade';
  static const String factoryMethod = 'factory_method';
  static const String flyweight = 'flyweight';
  static const String iterator = 'iterator';
  static const String mediator = 'mediator';
  static const String memento = 'memento';
  static const String observer = 'observer';
  static const String prototype = 'prototype';
  static const String proxy = 'proxy';
  static const String singleton = 'singleton';
  static const String state = 'state';
  static const String strategy = 'strategy';
  static const String templateMethod = 'template_method';
  static const String visitor = 'visitor';
}
