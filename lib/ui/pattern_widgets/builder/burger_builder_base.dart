import 'burger.dart';

abstract class BurgerBuilderBase {
  late Burger burger;
  late double price;

  void createBurger() {
    burger = Burger();
  }

  Burger getBurger() => burger;

  void setBurgerPrice() => burger.price = price;

  void addBuns();
  void addCheese();
  void addPatties();
  void addSauces();
  void addSeasoning();
  void addVegetables();
}