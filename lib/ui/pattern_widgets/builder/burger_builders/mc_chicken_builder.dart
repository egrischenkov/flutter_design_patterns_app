import '../burger_builder_base.dart';
import '../ingredients/ingredients_imports.dart';

class McChickenBuilder extends BurgerBuilderBase {
  McChickenBuilder() {
    price = 1.55;
  }

  @override
  void addBuns() {
    burger.addIngredient(RegularBun());
  }

  @override
  void addCheese() {
    /// Not needed
  }

  @override
  void addPatties() {
    burger.addIngredient(McChickenPatty());
  }

  @override
  void addSauces() {
    burger.addIngredient(Mayonnaise());
  }

  @override
  void addSeasoning() {
    // Not needed
  }

  @override
  void addVegetables() {
    burger.addIngredient(ShreddedLettuce());
  }
}