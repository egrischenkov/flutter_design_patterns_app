import '../entities/entity_base.dart';
import '../i_storage.dart';
import '../json_helper.dart';

class FileStorage extends IStorage {
  Map<Type, List<String>> fileStorage = <Type, List<String>>{};

  @override
  String getTitle() => 'File storage';

  @override
  List<T> fetchAll<T extends EntityBase>() {
    if (fileStorage.containsKey(T)) {
      final files = fileStorage[T]!;

      return files.map<T>((file) => JsonHelper.deSerialiseObject<T>(file)).toList();
    }
    return [];
  }

  @override
  void store<T extends EntityBase>(T entityBase) {
    if (!fileStorage.containsKey(T)) {
      fileStorage[T] = [];
    }
    fileStorage[T]!.add(JsonHelper.serialiseObject(entityBase));
  }

  void deleteAll<T extends EntityBase>() {
    if (fileStorage.containsKey(T)) {
      fileStorage[T]!.clear();
    }
  }
}