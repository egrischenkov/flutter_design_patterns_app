import 'package:flutter/material.dart';

import '../../entity/design_pattern.dart';
import '../../logic/extensions/context_extensions.dart';
import '../../utils/app_colors.dart';
import '../../utils/utils.dart';
import '../base_page.dart';
import '../widgets/markdown_widget.dart';
import '../widgets/vertical_space.dart';

class DetailsPage extends BasePage {
  final DesignPattern designPattern;
  final Widget innerWidget;

  DetailsPage({
    required this.designPattern,
    required this.innerWidget,
  });

  late final TabController _tabController;
  Color _getCurrentColor() => switchColor(designPattern);

  @override
  bool isCurvedAppBar() => false;

  @override
  Color backgroundColor() => _getCurrentColor();

  @override
  void init(BuildContext context, TickerProvider tickerProvider) {
    _tabController = TabController(length: 2, initialIndex: 0, vsync: tickerProvider);
  }

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      color: _getCurrentColor(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VerticalSpace(32),
          Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: tabLabelSelectedColor,
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              unselectedLabelColor: tabLabelUnselectedColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.symmetric(
                vertical: 6,
              ),
              indicator: BoxDecoration(
                gradient: LinearGradient(
                    colors: tabGradientColorLight,
                    stops: [0.5, 1.0],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight),
                borderRadius: BorderRadius.circular(30),
              ),
              enableFeedback: true,
              labelPadding: EdgeInsets.all(8),
              tabs: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Tab(
                    text: context.localizations.description,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Tab(
                    text: context.localizations.example,
                  ),
                )
              ],
            ),
          ),
          VerticalSpace(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                MarkdownWidget(designPattern: designPattern),
                innerWidget,
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  String getTitle(BuildContext context) => context.localizations.patterns_name(designPattern.id);
}
