import '../entities/customer.dart';

import '../entities/entity_base.dart';

import '../i_repository.dart';
import '../i_storage.dart';

class CustomerRepository extends IRepository {
  final IStorage storage;

  CustomerRepository(this.storage);

  @override
  List<EntityBase> getAll() {
    return storage.fetchAll<Customer>();
  }

  @override
  void save(EntityBase entityBase) {
    storage.store<Customer>(entityBase as Customer);
  }

  @override
  void deleteAll() {
    storage.deleteAll<Customer>();
  }
}