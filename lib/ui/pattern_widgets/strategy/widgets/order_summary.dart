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
import '../i_shipping_costs_strategy.dart';
import '../orders/order.dart';
import 'order_summary_row.dart';


class OrderSummary extends StatelessWidget {
  final Order order;
  final IShippingCostsStrategy shippingCostsStrategy;

  const OrderSummary({
    required this.order,
    required this.shippingCostsStrategy,
  });

  double get shippingPrice => shippingCostsStrategy.calculate(order);
  double get total => order.price + shippingPrice;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Order summary',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Divider(),
            OrderSummaryRow(
              fontFamily: 'Roboto',
              label: 'Subtotal',
              value: order.price,
            ),
            VerticalSpace(16),
            OrderSummaryRow(
              fontFamily: 'Roboto',
              label: 'Shipping',
              value: shippingPrice,
            ),
            const Divider(),
            OrderSummaryRow(
              fontFamily: 'RobotoMedium',
              label: 'Order total',
              value: total,
            ),
          ],
        ),
      ),
    );
  }
}
