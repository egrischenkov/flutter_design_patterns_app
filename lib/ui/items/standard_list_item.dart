import 'package:flutter/material.dart';

import '../../entity/design_pattern.dart';
import '../../logic/extensions/context_extensions.dart';
import '../../utils/app_colors.dart';
import '../widgets/vertical_space.dart';

class StandardListItem extends StatelessWidget {
  final DesignPattern designPattern;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;
  final bool isFavorite;

  const StandardListItem({
    required this.designPattern,
    required this.onTap,
    required this.onFavoriteTap,
    this.isFavorite = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: PhysicalModel(
        color: listItemBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        shadowColor: listTileShadowColor,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.localizations.patterns_name(designPattern.id),
                    style: TextStyle(
                        fontSize: 22,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                  ),
                  VerticalSpace(32),
                  FittedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Text(
                        context.localizations.patterns_description(designPattern.id),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 16, color: textColor),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_outline,
                      color: heartIconListTileColor,
                      size: 30,
                    ),
                  ),
                  onTap: onFavoriteTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
