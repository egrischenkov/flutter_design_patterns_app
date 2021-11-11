import 'package:flutter/material.dart';

import '../../entity/design_pattern.dart';
import '../../utils/app_colors.dart';
import '../../utils/utils.dart';
import '../base_page_state.dart';
import '../widgets/markdown_widget.dart';
import '../widgets/vertical_space.dart';

class DetailsPageState extends BasePageState
    with SingleTickerProviderStateMixin {
  final DesignPattern designPattern;
  final Widget innerWidget;

  DetailsPageState({
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
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
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
            labelColor: tabLabelSelectedLightColor,
            labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            unselectedLabelColor: tabLabelUnselectedLightColor,
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
                  text: 'Description',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Tab(
                  text: 'Example',
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
              MarkdownWidget(designPatternId: designPattern.id),
              innerWidget,
            ],
          ),
        ),
      ],
    );
  }

  @override
  String getTitle() => designPattern.id;
}
