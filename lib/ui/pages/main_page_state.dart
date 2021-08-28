import 'package:flutter/material.dart';

import '../../entity/design_pattern_type.dart';
import '../../utils/app_colors.dart';
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
          return CurvedListItem(
            title: patternTypes[index].id,
            subtitle: '${patternTypes[index].designPatterns.length} patterns',
            description: patternTypes[index].id,
            color: _colorSwitcher(index),
            nextColor: _colorSwitcher(index + 1),
          );
        },
      ),
    );
  }
}
