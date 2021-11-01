import '../burger_builder_base.dart';

class BurgerDropdownItem {
  final String label;
  final BurgerBuilderBase burgerBuilder;

  const BurgerDropdownItem({
    required this.label,
    required this.burgerBuilder,
  });
}