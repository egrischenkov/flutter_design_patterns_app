import 'pizza.dart';

abstract class PizzaDecorator extends Pizza {
  final Pizza pizza;

  PizzaDecorator(this.pizza);

  @override
  String getDescription();

  @override
  double getPrice();
}