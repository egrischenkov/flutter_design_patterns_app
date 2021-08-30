import 'package:flutter/material.dart';

import '../../entity/design_pattern_type.dart';
import '../../logic/navigation/app_router.dart';
import '../../utils/app_colors.dart';
import '../../utils/utils.dart';
import '../base_page_state.dart';
import '../items/curved_list_item.dart';

enum ListItemColors {
  firstColor,
  secondColor,
  thirdColor,
}

class MainPageState extends BasePageState {
  final List<DesignPatternType> patternTypes;

  MainPageState(this.patternTypes);

  @override
  Color backgroundColor() => firstListTileColorLight;

  Color _colorSwitcher(int index) {
    switch (index) {
      case 0:
        return firstListTileColorLight;
      case 1:
        return secondListTileColorLight;
      case 2:
        return thirdListTileColorLight;
      case 3:
        return mainPageBackgroundColorLight;
      default:
        throw ('Index is out of range. There is no such color!');
    }
  }

  @override
  Widget buildBody() {
    return Container(
      color: mainPageBackgroundColorLight,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: patternTypes.length,
        itemBuilder: (context, index) {
          var designPatternType = patternTypes[index];
          return CurvedListItem(
            title: designPatternType.id,
            subtitle: '${designPatternType.designPatterns.length} patterns',
            description: designPatternType.id,
            color: _colorSwitcher(index),
            nextColor: _colorSwitcher(index + 1),
            onTap: () => navigate(
              Navigation.categoryRoute,
              argument: {'pattern_type': designPatternType, 'color': _colorSwitcher(index)},
            ),
          );
        },
      ),
    );
  }

  @override
  String? getTitle() => 'Flutter Design Patterns';
}
