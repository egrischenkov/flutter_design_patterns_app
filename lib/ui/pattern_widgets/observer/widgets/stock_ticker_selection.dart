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

import '../stock_ticker_model.dart';

class StockTickerSelection extends StatelessWidget {
  final List<StockTickerModel> stockTickers;
  final ValueChanged<int> onChanged;

  const StockTickerSelection({
    required this.stockTickers,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (var i = 0; i < stockTickers.length; i++)
          Expanded(
            child: _TickerTile(
              stockTickerModel: stockTickers[i],
              index: i,
              onChanged: onChanged,
            ),
          )
      ],
    );
  }
}

class _TickerTile extends StatelessWidget {
  final StockTickerModel stockTickerModel;
  final int index;
  final ValueChanged<int> onChanged;

  const _TickerTile({
    required this.stockTickerModel,
    required this.index,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: stockTickerModel.subscribed ? Colors.black : Colors.white,
      child: InkWell(
        onTap: () => onChanged(index),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            stockTickerModel.stockTicker.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: stockTickerModel.subscribed ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
