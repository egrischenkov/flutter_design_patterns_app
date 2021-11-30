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

import '../../../widgets/common_elevated_button.dart';
import '../../../widgets/vertical_space.dart';
import '../i_shipping_costs_strategy.dart';
import '../orders/order.dart';
import '../orders/order_item.dart';
import '../strategies/in_store_pickup_strategy.dart';
import '../strategies/parcel_terminal_shipping_strategy.dart';
import '../strategies/priority_shipping_strategy.dart';
import 'order_items_table.dart';
import 'order_summary.dart';
import 'shipping_options.dart';

class StrategyPatternWidget extends StatefulWidget {
  @override
  _StrategyPatternWidgetState createState() => _StrategyPatternWidgetState();
}

class _StrategyPatternWidgetState extends State<StrategyPatternWidget> {
  final List<IShippingCostsStrategy> _shippingCostsStrategyList = [
    InStorePickupStrategy(),
    ParcelTerminalShippingStrategy(),
    PriorityShippingStrategy(),
  ];

  int _selectedStrategyIndex = 0;
  Order _order = Order();

  void _addToOrder() {
    setState((){
      _order.items.add(OrderItem.random());
    });
  }

  void _clearOrder() {
    setState(() {
      _order = Order();
    });
  }

  void _setSelectedStrategyIndex(int? index) {
    setState(() {
      _selectedStrategyIndex = index ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonElevatedButton(title: 'Add random item', onTap: _addToOrder),
              CommonElevatedButton(title: 'Clear', onTap: _clearOrder),
            ],
          ),
          VerticalSpace(16),
          Stack(
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _order.items.isEmpty ? 1.0 : 0.0,
                child: Center(child: Text('Your order is empty')),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _order.items.isEmpty ? 0.0 : 1.0,
                child: Column(
                  children: [
                    OrderItemsTable(
                      orderItems: _order.items,
                    ),
                    ShippingOptions(
                      selectedIndex: _selectedStrategyIndex,
                      shippingOptions: _shippingCostsStrategyList,
                      onChanged: _setSelectedStrategyIndex,
                    ),
                    OrderSummary(
                      shippingCostsStrategy: _shippingCostsStrategyList[_selectedStrategyIndex],
                      order: _order,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
