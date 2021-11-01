import '../pizza.dart';
import '../pizza_decorator.dart';

class OliveOil extends PizzaDecorator {
  OliveOil(Pizza pizza) : super(pizza) {
    description = 'Olive oil';
}

  @override
  String getDescription() => '${pizza.getDescription()}\n- $description';

  @override
  double getPrice() => pizza.getPrice() + 0.1;
}