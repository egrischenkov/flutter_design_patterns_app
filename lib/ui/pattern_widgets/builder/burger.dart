import 'ingredients/ingredient.dart';

class Burger {
  final List<Ingredient> _ingredients = [];
  late double price;

  void addIngredient(Ingredient ingredient) {
    _ingredients.add(ingredient);
  }

  String getFormattedIngredients() {
    return _ingredients.map((ingredient) => ingredient.getName().splitMapJoin(', ')).toString();
  }

  String getFormattedAllergens() {
    var allergens = <String>{};

    _ingredients.forEach((ingredient) => allergens.addAll(ingredient.allergens));

    return allergens.join(', ');
  }

  String getFormattedPrice() {
    return '\$${price.toStringAsFixed(2)}';
  }
}