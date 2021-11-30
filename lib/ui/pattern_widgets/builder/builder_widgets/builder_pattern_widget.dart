/*
Copyright (c) 2019 Mangirdas Kazlauskas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

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
