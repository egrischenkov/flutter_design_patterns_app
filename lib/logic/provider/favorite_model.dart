import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../entity/design_pattern.dart';
import '../database/database_provider.dart';

class FavoriteModel extends ChangeNotifier {
  var favoritePatterns = <DesignPattern>[];

  Future<List<DesignPattern>> loadFavoriteDesignPatterns() async {
    favoritePatterns = await DatabaseProvider.instance.getFavoritePatterns();
    return favoritePatterns;
  }

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: Duration(milliseconds: 1200),
    ));
  }

  Future<void> addToFavorite(BuildContext context, DesignPattern pattern) async {
    await DatabaseProvider.instance.addFavoriteDesignPattern(pattern);
    favoritePatterns.add(pattern);
    _showSnackBar(context, '${pattern.id} add to favorite');
    notifyListeners();
  }

  Future<void> removeFromFavorite(BuildContext context, DesignPattern pattern) async {
    await DatabaseProvider.instance.removeFromFavoriteDesignPattern(pattern);
    favoritePatterns.removeWhere((favoritePattern) {
      return favoritePattern.id == pattern.id;
    });
    _showSnackBar(context, '${pattern.id} remove from favorite');
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
