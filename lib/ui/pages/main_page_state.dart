import 'package:flutter/material.dart';

import '../../entity/design_pattern_type.dart';
import '../../logic/extensions/context_extensions.dart';
import '../../logic/navigation/app_router.dart';
import '../../utils/app_colors.dart';
import '../../utils/utils.dart';
import '../base_page_state.dart';
import '../items/curved_list_item.dart';

class MainPageState extends BasePageState {
  final List<DesignPatternType> patternTypes;

  MainPageState(this.patternTypes);

  @override
  Color backgroundColor() => firstListTileColor;

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      color: mainBackgroundColor,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: patternTypes.length,
        itemBuilder: (context, index) {
          var designPatternType = patternTypes[index];

          return CurvedListItem(
            title: context.localizations.pattern_types(designPatternType.id),
            subtitle: context.localizations.patterns(designPatternType.designPatterns.length),
            description: context.localizations.pattern_types_description(designPatternType.id),
            color: switchColor(patternTypes[index].designPatterns.first),
            nextColor:
                index == 2 ? mainBackgroundColor : switchColor(patternTypes[index + 1].designPatterns.first),
            onTap: () => navigate(
              Navigation.categoryRoute,
              argument: {'pattern_type': designPatternType},
            ),
          );
        },
      ),
    );
  }

  @override
  String? getTitle() => context.localizations.main_title;
}
