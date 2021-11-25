import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../entity/design_pattern.dart';
import '../../logic/extensions/context_extensions.dart';
import '../../logic/provider/favorite_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/utils.dart';
import '../base_page_state.dart';
import '../items/standard_list_item.dart';
import '../widgets/vertical_space.dart';

class FavoritePageState extends BasePageState {
  @override
  bool isFavoritePage() => true;

  @override
  bool isCurvedAppBar() => false;

  @override
  Color? backgroundColor() => favoriteScreenBackgroundColor;

  @override
  String? getTitle() => context.localizations.favorite;

  Future<void> _onFavoriteTap(BuildContext context, FavoriteModel favoriteModel,
      DesignPattern pattern) {
    return favoriteModel.removeFromFavorite(context, pattern);
  }

  @override
  Widget buildBody(BuildContext context) {
    final favoriteModel = context.watch<FavoriteModel>();
    final favoritePatterns = favoriteModel.favoritePatterns;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: favoriteScreenBackgroundColor,
      child: favoritePatterns.isEmpty
          ? Center(
              child: Text(
                context.localizations.warning_no_favorite,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              itemCount: favoritePatterns.length,
              itemBuilder: (context, index) {
                final designPattern = favoritePatterns[index];
                return StandardListItem(
                  designPattern: designPattern,
                  onTap: () {
                    navigate(
                      '/${designPattern.id.toString()}',
                      argument: {
                        "design_pattern": designPattern,
                      },
                      replace: true,
                    );
                  },
                  onFavoriteTap: () async => await _onFavoriteTap(
                    context,
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
