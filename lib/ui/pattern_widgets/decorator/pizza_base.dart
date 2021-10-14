import 'pizza.dart';

class PizzaBase extends Pizza {
  PizzaBase(String description) {
    this.description = description;
  }

  @override
  String getDescription() => description;

  @override
  double getPrice() => 3.0;
}