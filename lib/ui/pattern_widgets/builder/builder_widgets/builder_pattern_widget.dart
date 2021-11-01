import 'package:flutter/material.dart';
import '../../../widgets/vertical_space.dart';

import '../burger.dart';
import '../burger_builders/burger_builders_imports.dart';
import '../burger_builders/hamburger_builder.dart';
import '../burger_maker.dart';
import 'builder_information_column.dart';
import 'burger_drop_down_item.dart';

class BuilderPatternWidget extends StatefulWidget {
  @override
  _BuilderPatternWidgetState createState() => _BuilderPatternWidgetState();
}

class _BuilderPatternWidgetState extends State<BuilderPatternWidget> {
  final _burgerMaker = BurgerMaker(HamburgerBuilder());
  final List<BurgerDropdownItem> _burgerItems = [];
  late BurgerDropdownItem _selectedBurgerItem;
  late Burger _selectedBurger;

  @override
  void initState() {
    super.initState();
    _burgerItems.addAll(
      [
        BurgerDropdownItem(
          label: 'Hamburger',
          burgerBuilder: HamburgerBuilder(),
        ),
        BurgerDropdownItem(
          label: 'Cheeseburger',
          burgerBuilder: CheeseburgerBuilder(),
        ),
        BurgerDropdownItem(
          label: 'McChicken burger',
          burgerBuilder: McChickenBuilder(),
        ),
        BurgerDropdownItem(
          label: 'BigMac',
          burgerBuilder: BigMacBuilder(),
        ),
      ],
    );
    _selectedBurgerItem = _burgerItems[0];
    _selectedBurger = _prepareSelectedBurger();
  }

  Burger _prepareSelectedBurger() {
    _burgerMaker.prepareBurger();
    return _burgerMaker.getBurger();
  }

  void _onBurgerMenuItemChanged(BurgerDropdownItem selectedItem) {
    setState(() {
      _selectedBurgerItem = selectedItem;
      _burgerMaker.changeBurgerBuilder(selectedItem.burgerBuilder);
      _selectedBurger = _prepareSelectedBurger();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select menu item:'),
          DropdownButton(
            value: _selectedBurgerItem,
            items: _burgerItems.map<DropdownMenuItem<BurgerDropdownItem>>((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item.label),
              );
            }).toList(),
            onChanged: (item) => _onBurgerMenuItemChanged(item as BurgerDropdownItem),
          ),
          VerticalSpace(32),
          Text('Information:'),
          VerticalSpace(16),
          BurgerInformationColumn(burger: _selectedBurger),
        ],
      ),
    );
  }
}
