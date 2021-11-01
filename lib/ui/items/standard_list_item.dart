import 'package:flutter/material.dart';

import '../../entity/design_pattern.dart';
import '../../utils/app_colors.dart';
import '../widgets/vertical_space.dart';

class StandardListItem extends StatelessWidget {
  final DesignPattern designPattern;
  final VoidCallback onTap;

  const StandardListItem({required this.designPattern, required this.onTap});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                designPattern.id,
                style: TextStyle(fontSize: 22, color: listTileTextLightColor, fontWeight: FontWeight.bold),
              ),
              VerticalSpace(32),
              Text(
                designPattern.id,
                style: TextStyle(fontSize: 16, color: listTileTextLightColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
