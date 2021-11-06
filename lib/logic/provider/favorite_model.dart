import 'package:flutter/cupertino.dart';

import '../../entity/design_pattern.dart';
import '../database/database_provider.dart';

class FavoriteModel extends ChangeNotifier {
  var favoritePatterns = <DesignPattern>[];

  Future<List<DesignPattern>> loadFavoriteDesignPatterns() async {
    favoritePatterns = await DatabaseProvider.instance.getFavoritePatterns();
    return favoritePatterns;
  }

  Future<void> addToFavorite(DesignPattern pattern) async {
    await DatabaseProvider.instance.addFavoriteDesignPattern(pattern);
    favoritePatterns.add(pattern);
    notifyListeners();
  }

  Future<void> removeFromFavorite(DesignPattern pattern) async {
    await DatabaseProvider.instance.removeFromFavoriteDesignPattern(pattern);
    favoritePatterns.removeWhere((favoritePattern) {
      return favoritePattern.id == pattern.id;
    });
    notifyListeners();
  }

  bool isFavorite(DesignPattern pattern) {
    for (var favoritePattern in favoritePatterns) {
      if (favoritePattern.id == pattern.id) {
        return true;
      }
    }

    return false;
  }
}
