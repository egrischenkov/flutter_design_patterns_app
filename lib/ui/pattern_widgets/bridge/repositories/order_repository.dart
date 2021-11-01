import '../entities/entity_base.dart';
import '../entities/order.dart';

import '../i_repository.dart';
import '../i_storage.dart';

class OrderRepository extends IRepository {
  final IStorage storage;

  OrderRepository(this.storage);

  @override
  List<EntityBase> getAll() {
    return storage.fetchAll<Order>();
  }

  @override
  void save(EntityBase entityBase) {
    storage.store<Order>(entityBase as Order);
  }

  @override
  void deleteAll() {
    storage.deleteAll<Order>();
  }
}