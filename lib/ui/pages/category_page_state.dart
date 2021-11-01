import 'package:flutter/material.dart';

import '../../entity/design_pattern_type.dart';
import '../../utils/utils.dart';
import '../base_page_state.dart';
import '../items/standard_list_item.dart';
import '../widgets/vertical_space.dart';

class CategoryPageState extends BasePageState {
  final DesignPatternType designPatternType;
  final Color color;

  CategoryPageState({required this.designPatternType, required this.color});

  @override
  bool isCurvedAppBar() => false;

  @override
  Color backgroundColor() => color;

  @override
  String getTitle() => designPatternType.id;

  @override
  Widget buildBody() {
    return Container(
      color: color,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        itemCount: designPatternType.designPatterns.length,
        itemBuilder: (context, index) {
          final designPattern = designPatternType.designPatterns[index];
          return StandardListItem(
            designPattern: designPattern,
            onTap: () {
              navigate(
                '/${designPattern.id.toString()}',
                argument: {"design_pattern": designPattern, "app_bar_color": color},
              );
            },
          );
        },
        separatorBuilder: (context, _) => VerticalSpace(),
      ),
    );
  }
}