import '../i_shipping_costs_strategy.dart';

class PriorityShippingStrategy implements IShippingCostsStrategy {
  @override
  String label = 'Priority shipping';

  @override
  double calculate(order) {
    return 9.99;
  }

}