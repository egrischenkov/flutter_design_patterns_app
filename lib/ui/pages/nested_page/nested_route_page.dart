import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../logic/extensions/context_extensions.dart';
import '../../../logic/navigation/app_router/app_router.dart';
import '../../base_page.dart';

class NestedRoutePage extends BasePage {
  @override
  bool isCurvedAppBar() => false;

  @override
  Widget buildBody(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        FirstNestedRoute(),
        SecondNestedRoute(),
        ThirdNestedRoute(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            selectedItemColor: Colors.red,
            items: [
              BottomNavigationBarItem(label: 'first', icon: Icon(Icons.one_k)),
              BottomNavigationBarItem(label: 'second', icon: Icon(Icons.two_k)),
              BottomNavigationBarItem(label: 'third', icon: Icon(Icons.three_k)),
            ],
          ),
        );
      },
    );
  }

  @override
  String? getTitle(BuildContext context) => context.localizations.nested_route;
}
