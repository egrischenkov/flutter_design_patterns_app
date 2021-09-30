import '../entities/entity_base.dart';
import '../i_storage.dart';

class SqlStorage extends IStorage {
  final Map<Type, List<EntityBase>> sqlStorage = {};

  @override
  String getTitle() => 'SQL storage';

  @override
  List<T> fetchAll<T extends EntityBase>() {
    return sqlStorage.containsKey(T) ? sqlStorage[T]! as List<T> : [];
  }

  @override
  void store<T extends EntityBase>(T entityBase) {
    if (!sqlStorage.containsKey(T)) {
      sqlStorage[T] = <T>[];
    }

    sqlStorage[T]!.add(entityBase);
  }

  void deleteAll<T extends EntityBase>() {
    if (sqlStorage.containsKey(T)) {
      sqlStorage[T]!.clear();
    }
  }
}