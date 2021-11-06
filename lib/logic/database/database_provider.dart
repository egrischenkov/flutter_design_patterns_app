import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../entity/design_pattern.dart';

const tableName = 'favorite';

class DatabaseProvider {
  static DatabaseProvider? _dbProvider;
  static Database? _database;

  DatabaseProvider._();

  static get instance {
    if (_dbProvider == null) {
      _dbProvider = DatabaseProvider._();
    }
    return _dbProvider;
  }

  Future<Database> initDatabase(List<DesignPattern> patterns) async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'favorite.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE favorite ('
            'favorite_id INTEGER PRIMARY KEY AUTOINCREMENT, '
            'pattern_name VARCHAR(25), '
            'is_favorite INTEGER DEFAULT 0'
            ');');
        await _fillFavoriteTable(db, patterns);
      },
    ).then((database) => _database = database);
  }

  String _convertPatternsToValuesString(List<DesignPattern> patterns) {
    var valuesString = '';

    for (var patternIndex = 0; patternIndex < patterns.length; patternIndex++) {
      valuesString +=
          '("${patterns[patternIndex].id}")${patternIndex == patterns.length - 1 ? '' : ', '}';
    }

    return valuesString;
  }

  Future _fillFavoriteTable(Database database, List<DesignPattern> patterns) {
    return database.execute('INSERT INTO favorite (pattern_name) '
        'VALUES ${_convertPatternsToValuesString(patterns)}');
  }

  Future<List<DesignPattern>> getFavoritePatterns() async {
    final rawList = await _database!.rawQuery('SELECT pattern_name '
        'FROM favorite '
        'WHERE is_favorite = 1');
    var favoritePatternsList = <DesignPattern>[];

    if (rawList.isNotEmpty) {
      favoritePatternsList.addAll(rawList.map((raw) {
        var newRaw = <String, dynamic>{};
        newRaw['id'] = raw['pattern_name'];
        newRaw['route'] = '/${raw['pattern_name']}';
        return DesignPattern.fromJson(newRaw);
      }).toList());
    }

    return favoritePatternsList;
  }

  Future addFavoriteDesignPattern(DesignPattern pattern) {
    return _database!.execute('UPDATE favorite '
        'SET is_favorite = 1 '
        'WHERE pattern_name = "${pattern.id}"');
  }

  Future removeFromFavoriteDesignPattern(DesignPattern pattern) {
    return _database!.execute('UPDATE favorite '
        'SET is_favorite = 0 '
        'WHERE pattern_name = "${pattern.id}"');
  }
}