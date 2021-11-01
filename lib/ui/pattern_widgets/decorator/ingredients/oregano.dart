import '../pizza.dart';
import '../pizza_decorator.dart';

class Oregano extends PizzaDecorator {
  Oregano(Pizza pizza) : super(pizza) {
    description = 'Oregano';
  }
  @override
  String getDescription() => '${pizza.getDescription()}\n- $description';

  @override
  double getPrice() => pizza.getPrice() + 0.2;
}