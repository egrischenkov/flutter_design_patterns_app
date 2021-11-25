import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../entity/design_pattern.dart';
import '../../entity/design_pattern_type.dart';
import '../../logic/extensions/context_extensions.dart';
import '../../logic/provider/favorite_model.dart';
import '../../utils/utils.dart';
import '../base_page_state.dart';
import '../items/standard_list_item.dart';
import '../widgets/vertical_space.dart';

class CategoryPageState extends BasePageState {
  final DesignPatternType designPatternType;

  CategoryPageState({required this.designPatternType});

  @override
  bool isCurvedAppBar() => false;

  @override
  Color backgroundColor() => _getCurrentColor();

  @override
  String getTitle() => context.localizations.pattern_types(designPatternType.id);

  Color _getCurrentColor() {
    return switchColor(designPatternType.designPatterns.first);
  }

  bool _isFavorite(FavoriteModel favoriteModel, DesignPattern pattern) {
    return favoriteModel.isFavorite(pattern);
  }

  Future _onFavoriteTap(BuildContext context, FavoriteModel favoriteModel,
      DesignPattern pattern) {
    return favoriteModel.isFavorite(pattern)
        ? favoriteModel.removeFromFavorite(context, pattern)
        : favoriteModel.addToFavorite(context, pattern);
  }

  @override
  Widget buildBody(BuildContext context) {
    final favoriteModel = context.watch<FavoriteModel>();
    return Container(
      color: _getCurrentColor(),
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
                argument: {
                  "design_pattern": designPattern,
                },
              );
            },
            onFavoriteTap: () async => await _onFavoriteTap(
              context,
              favoriteModel,
              designPattern,
            ),
            isFavorite: _isFavorite(favoriteModel, designPattern),
          );
        },
        separatorBuilder: (context, _) => VerticalSpace(),
      ),
    );
  }
}
