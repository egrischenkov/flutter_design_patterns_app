import 'orders/order.dart';

abstract class IShippingCostsStrategy {
  abstract String label;
  double calculate(Order order);
}