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

import 'dart:async';

import 'package:flutter/material.dart';

import '../stock.dart';
import '../stock_subscribers/default_stock_subscriber.dart';
import '../stock_subscribers/growing_stock_subscriber.dart';
import '../stock_subscribers/stock_subscriber.dart';
import '../stock_ticker_model.dart';
import '../stock_tickers/game_stop_ticker.dart';
import '../stock_tickers/google_stock_ticker.dart';
import '../stock_tickers/tesla_stock_ticker.dart';
import 'stock_row.dart';
import 'stock_subscriber_selection.dart';
import 'stock_ticker_selection.dart';

class ObserverPatternWidget extends StatefulWidget {
  @override
  _ObserverPatternWidgetState createState() => _ObserverPatternWidgetState();
}

class _ObserverPatternWidgetState extends State<ObserverPatternWidget> {
  final _stockSubscriberList = <StockSubscriber>[
    DefaultStockSubscriber(),
    GrowingStockSubscriber(),
  ];

  final _stockTickers = <StockTickerModel>[
    StockTickerModel(stockTicker: GameStockTicker()),
    StockTickerModel(stockTicker: GoogleStockTicker()),
    StockTickerModel(stockTicker: TeslaStockTicker()),
  ];

  final _stockEntries = <Stock>[];

  StreamSubscription<Stock>? _stockStreamSubscription;
  StockSubscriber _subscriber = DefaultStockSubscriber();
  int _selectedSubscriberIndex = 0;

  @override
  void initState() {
    super.initState();
    _stockStreamSubscription = _subscriber.stockStream.listen(_onStockChange);
  }

  @override
  void dispose() {
    for (final ticker in _stockTickers) {
      ticker.stockTicker.stockTimer;
    }
    _stockStreamSubscription?.cancel();
    super.dispose();
  }

  void _onStockChange(Stock stock) {
    setState(() {
      _stockEntries.add(stock);
    });
  }

  void _setSelectedSubscriberIndex(int? index) {
    for (final ticker in _stockTickers) {
      if (ticker.subscribed) {
        ticker.toggleSubscribed();
        ticker.stockTicker.unsubscribe(_subscriber);
      }
    }

    _stockStreamSubscription?.cancel();

    setState(() {
      _stockEntries.clear();
      _selectedSubscriberIndex = index!;
      _subscriber = _stockSubscriberList[_selectedSubscriberIndex];
      _stockStreamSubscription = _subscriber.stockStream.listen(_onStockChange);
    });
  }

  void _toggleStockTickerSelection(int index) {
    final stockTickerModel = _stockTickers[index];
    final stockTicker = stockTickerModel.stockTicker;

    if (stockTickerModel.subscribed) {
      stockTicker.unsubscribe(_subscriber);
    } else {
      stockTicker.subscribe(_subscriber);
    }

    setState(stockTickerModel.toggleSubscribed);
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            StockSubscriberSelection(
              stockSubscriberList: _stockSubscriberList,
              selectedIndex: _selectedSubscriberIndex,
              onChanged: _setSelectedSubscriberIndex,
            ),
            StockTickerSelection(
              stockTickers: _stockTickers,
              onChanged: _toggleStockTickerSelection,
            ),
            Column(
              children: [
                for (final stock in _stockEntries.reversed)
                  StockRow(stock: stock)
              ],
            )
          ],
        ),
      ),
    );
  }
}
