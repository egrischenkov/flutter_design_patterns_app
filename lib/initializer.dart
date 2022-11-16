import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'entity/design_pattern.dart';
import 'entity/design_pattern_type.dart';
import 'entity/repository/design_patterns_repository.dart';
import 'logic/database/database_provider.dart';
import 'logic/navigation/app_router/app_router.dart';
import 'logic/provider/favorite_model.dart';

class Initializer {
  DesignPatternsRepository repository = DesignPatternsRepository();

  List<DesignPattern> _convertPatternTypesToPatternsList(
    List<DesignPatternType> types,
  ) {
    var patterns = <DesignPattern>[];

    for (var type in types) {
      patterns.addAll(type.designPatterns);
    }

    return patterns;
  }

  Future init(BuildContext context) {
    return repository.init().then(
      (patternsConfig) async {
        final patternTypes = patternsConfig.patternTypes;

        final patterns = _convertPatternTypesToPatternsList(patternTypes);

        await DatabaseProvider.instance.initDatabase(patterns);

        await context.read<FavoriteModel>().loadFavoriteDesignPatterns();

        context.router.popAndPush(MainRoute(patternTypes: patternTypes));
      },
    );
  }
}
