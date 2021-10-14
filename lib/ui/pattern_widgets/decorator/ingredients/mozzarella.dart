import '../pizza.dart';
import '../pizza_decorator.dart';

class Mozzarella extends PizzaDecorator {
  Mozzarella(Pizza pizza) : super(pizza) {
    description = 'Mozzarella';
  }

  @override
  String getDescription() => '${pizza.getDescription()}\n- $description';

  @override
  double getPrice() => pizza.getPrice() + 0.5;
}