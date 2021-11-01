import '../i_shipping_costs_strategy.dart';
import '../orders/order.dart';

class InStorePickupStrategy implements IShippingCostsStrategy {
  @override
  String label = 'In-store pickup';

  @override
  double calculate(Order order) {
    return 0.0;
  }
  
}