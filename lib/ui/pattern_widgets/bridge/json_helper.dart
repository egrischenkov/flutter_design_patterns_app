import 'dart:convert';

import 'entities/customer.dart';
import 'entities/entity_base.dart';
import 'entities/order.dart';

//ignore: avoid_classes_with_only_static_members
class JsonHelper {
  static String serialiseObject(EntityBase entityBase) {
    return jsonEncode(entityBase);
  }

  static T deSerialiseObject<T extends EntityBase>(String jsonString) {
    final json = jsonDecode(jsonString);

    switch (T) {
      case Customer:
        return Customer.fromJson(json) as T;
      case Order:
        return Order.fromJson(json) as T;
      default:
        throw Exception("Type of $T is not supported");
    }
  }
}