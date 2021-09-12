import 'package:flutter/material.dart';

import '../../entity/design_pattern_type.dart';
import '../../ui/page_state_factory.dart';
import '../../ui/pages/category_page_state.dart';
import '../../ui/pages/details_page_state.dart';
import '../../ui/pages/init_page_state.dart';
import '../../ui/pages/main_page_state.dart';
import '../../ui/pattern_widgets/abstract_factory/widgets/abstract_factory_pattern_widget.dart';
import '../../ui/pattern_widgets/adapter_pattern_widget.dart';
import '../../ui/pattern_widgets/bridge_pattern_widget.dart';
import '../../ui/pattern_widgets/builder_pattern_widget.dart';
import '../../ui/pattern_widgets/chain_of_responsibility_pattern_widget.dart';
import '../../ui/pattern_widgets/command_pattern_widget.dart';
import '../../ui/pattern_widgets/composite_pattern_widget.dart';
import '../../ui/pattern_widgets/decorator_pattern_widget.dart';
import '../../ui/pattern_widgets/facade_pattern_widget.dart';
import '../../ui/pattern_widgets/factory_pattern_widget.dart';
import '../../ui/pattern_widgets/fly_weight_pattern_widget.dart';
import '../../ui/pattern_widgets/interpretator_pattern_widget.dart';
import '../../ui/pattern_widgets/iterator_pattern_widget.dart';
import '../../ui/pattern_widgets/mediator_pattern_widget.dart';
import '../../ui/pattern_widgets/memento_pattern_widget.dart';
import '../../ui/pattern_widgets/observer_pattern_widget.dart';
import '../../ui/pattern_widgets/protorype_pattern_widget.dart';
import '../../ui/pattern_widgets/proxy_pattern_widget.dart';
import '../../ui/pattern_widgets/singleton_pattern_widget.dart';
import '../../ui/pattern_widgets/state_pattern_widget.dart';
import '../../ui/pattern_widgets/strategy_pattern_widget.dart';
import '../../ui/pattern_widgets/template_method_pattern_widget.dart';
import '../../ui/pattern_widgets/visitor_pattern_widget.dart';

class AppRouter {
  const AppRouter._();

  static _checkArgument<T>(Object? arg) {
    if (arg is! T) {
      throw "Invalid argument type of $arg, expected $T";
    }
    return arg;
  }

  static MaterialPageRoute _buildDesignPatternDetailsPageRoute(
    RouteSettings routeSettings,
    Widget innerWidget,
  ) {
    final navigateArgument = _checkArgument<Map<String,dynamic>>(routeSettings.arguments);
    return MaterialPageRoute(
      builder: (context) => PageStateFactory(
        concreteState: () => DetailsPageState(
          designPattern: navigateArgument["design_pattern"],
          innerWidget: innerWidget,
          appBarColor: navigateArgument["app_bar_color"],
        ),
      ),
    );
  }

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Navigation.initRoute:
        return MaterialPageRoute(
          builder: (context) => PageStateFactory(concreteState: () => InitPageState()),
        );
      case Navigation.mainRoute:
        final patternTypes = _checkArgument<List<DesignPatternType>>(routeSettings.arguments);
        return MaterialPageRoute(
          builder: (context) => PageStateFactory(concreteState: () => MainPageState(patternTypes)),
        );
      case Navigation.categoryRoute:
        final navigateArgument = _checkArgument<Map<String, dynamic>>(routeSettings.arguments);
        return MaterialPageRoute(
          builder: (context) => PageStateFactory(
            concreteState: () => CategoryPageState(
              designPatternType: navigateArgument['pattern_type'],
              color: navigateArgument['color'],
            ),
          ),
        );
      case Navigation.abstractFactoryRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, AbstractFactoryPatternWidget());
      case Navigation.adapterRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, AdapterPatternWidget());
      case Navigation.bridgeRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, BridgePatternWidget());
      case Navigation.builderRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, BuilderPatternWidget());
      case Navigation.chainOfResponsibilityRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, ChainOfResponsibilityPatternWidget());
      case Navigation.commandRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, CommandPatternWidget());
      case Navigation.compositeRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, CompositePatternWidget());
      case Navigation.decoratorRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, DecoratorPatternWidget());
      case Navigation.facadeRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, FacadePatternWidget());
      case Navigation.factoryMethodRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, FactoryMethodPatternWidget());
      case Navigation.flyweightRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, FlyWeightPatternWidget());
      case Navigation.interpreterRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, InterpreterPatternWidget());
      case Navigation.iteratorRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, IteratorPatternWidget());
      case Navigation.mediatorRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, MediatorPatternWidget());
      case Navigation.mementoRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, MementoPatternWidget());
      case Navigation.observerRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, ObserverPatternWidget());
      case Navigation.prototypeRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, PrototypePatternWidget());
      case Navigation.proxyRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, ProxyPatternWidget());
      case Navigation.singletonRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, SingletonePatternWidget());
      case Navigation.stateRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, StatePatternWidget());
      case Navigation.strategyRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, StrategyPatternWidget());
      case Navigation.templateMethodRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, TemplateMethodPatternWidget());
      case Navigation.visitorRoute:
        return _buildDesignPatternDetailsPageRoute(routeSettings, VisitorPatternWidget());
      default:
        throw Exception("Unknown navigation route: ${routeSettings.name}");
    }
  }
}

class Navigation {
  static const String initRoute = '/';
  static const String mainRoute = '/main_page';
  static const String categoryRoute = '/category_page';
  static const String abstractFactoryRoute = '/abstract_factory';
  static const String adapterRoute = '/adapter';
  static const String bridgeRoute = '/bridge';
  static const String builderRoute = '/builder';
  static const String chainOfResponsibilityRoute = '/chain_of_responsibility';
  static const String commandRoute = '/command';
  static const String compositeRoute = '/composite';
  static const String decoratorRoute = '/decorator';
  static const String facadeRoute = '/facade';
  static const String factoryMethodRoute = '/factory_method';
  static const String flyweightRoute = '/flyweight';
  static const String interpreterRoute = '/interpreter';
  static const String iteratorRoute = '/iterator';
  static const String mediatorRoute = '/mediator';
  static const String mementoRoute = '/memento';
  static const String observerRoute = '/observer';
  static const String prototypeRoute = '/prototype';
  static const String proxyRoute = '/proxy';
  static const String singletonRoute = '/singleton';
  static const String stateRoute = '/state';
  static const String strategyRoute = '/strategy';
  static const String templateMethodRoute = '/template-method';
  static const String visitorRoute = '/visitor';
}