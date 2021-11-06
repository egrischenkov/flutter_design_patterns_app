import 'package:flutter/material.dart';

import '../../entity/design_pattern.dart';
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
        color: listTileBackgroundLightColor,
        borderRadius: BorderRadius.circular(10),
        shadowColor: listTileShadowColor,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    designPattern.id,
                    style: TextStyle(
                        fontSize: 22,
                        color: listTileTextLightColor,
                        fontWeight: FontWeight.bold),
                  ),
                  VerticalSpace(32),
                  Text(
                    designPattern.id,
                    style:
                        TextStyle(fontSize: 16, color: listTileTextLightColor),
                  ),
                ],
              ),
              InkWell(
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_outline,
                  color: Colors.red,
                  size: 30,
                ),
                onTap: onFavoriteTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
