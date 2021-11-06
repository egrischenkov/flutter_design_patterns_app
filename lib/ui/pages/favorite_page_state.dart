import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../entity/design_pattern.dart';
import '../../logic/provider/favorite_model.dart';
import '../../utils/utils.dart';
import '../base_page_state.dart';
import '../items/standard_list_item.dart';
import '../widgets/vertical_space.dart';

class FavoritePageState extends BasePageState {
  final Color color;

  FavoritePageState({required this.color});

  @override
  bool isCurvedAppBar() => false;

  @override
  Color? backgroundColor() => color;

  @override
  String? getTitle() => 'Favorite';

  Future<void> _onFavoriteTap(FavoriteModel favoriteModel, DesignPattern pattern) {
    return favoriteModel.removeFromFavorite(pattern);
  }

  @override
  Widget buildBody(BuildContext context) {
    final favoriteModel = context.watch<FavoriteModel>();

    return Container(
      color: color,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        itemCount: favoriteModel.favoritePatterns.length,
        itemBuilder: (context, index) {
          final designPattern = favoriteModel.favoritePatterns[index];
          return StandardListItem(
            designPattern: designPattern,
            onTap: ()  {
              navigate(
                '/${designPattern.id.toString()}',
                argument: {
                  "design_pattern": designPattern,
                  "app_bar_color": color,
                },
                replace: true,
              );
            },
            onFavoriteTap: () async => await _onFavoriteTap(
              favoriteModel,
              designPattern,
            ),
          );
        },
        separatorBuilder: (context, _) => VerticalSpace(),
      ),
    );
  }
}