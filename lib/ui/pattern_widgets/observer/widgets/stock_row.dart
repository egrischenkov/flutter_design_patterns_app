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
import '../../../../utils/app_colors.dart';

import '../stock.dart';
import '../stock_change_direction.dart';
import '../stock_ticker_symbol.dart';

class StockRow extends StatelessWidget {
  final Stock stock;

  Color get color => stock.changeDirection == StockChangeDirection.growing
      ? stockUpColor
      : stockDownColor;

  const StockRow({
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16 * 2,
          child: Text(
            stock.symbol.toShortString(),
            style: TextStyle(color: color),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 16 * 2,
          child: Text(
            stock.price.toString(),
            style: TextStyle(color: color),
            textAlign: TextAlign.end,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Icon(
            stock.changeDirection == StockChangeDirection.growing
                ? Icons.arrow_upward
                : Icons.arrow_downward,
            color: color,
          ),
        ),
        Text(
          stock.changeAmount.toStringAsFixed(2),
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
