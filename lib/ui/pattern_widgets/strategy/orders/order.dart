import 'order_item.dart';

class Order {
  final List<OrderItem> items = [];

  double get price {
    return items.fold(0.0, (sum, item) => sum + item.price);
  }

  void addOrderItem(OrderItem orderItem) {
    items.add(orderItem);
  }
}