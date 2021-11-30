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

import 'package:faker/faker.dart';
import 'package:meta/meta.dart';

import '../stock.dart';
import '../stock_change_direction.dart';
import '../stock_subscribers/stock_subscriber.dart';
import '../stock_ticker_symbol.dart';

abstract class StockTicker {
  late final String title;
  late final Timer stockTimer;

  @protected
  Stock? stock;

  final _subscribers = <StockSubscriber>[];

  void subscribe(StockSubscriber subscriber) => _subscribers.add(subscriber);

  void unsubscribe(StockSubscriber subscriber) {
    _subscribers.removeWhere((s) => s.id == subscriber.id);
  }

  void notifySubscribers() {
    for (final subscriber in _subscribers) {
      subscriber.update(stock!);
    }
  }

  void setStock(StockTickerSymbol stockTickerSymbol, int min, int max) {
    final lastStock = stock;
    final price = faker.randomGenerator.integer(max, min: min).toDouble();
    final changeAmount =  lastStock != null ? price - lastStock.price : 0.0;

    stock = Stock(
      changeAmount: changeAmount.abs(),
      changeDirection: changeAmount > 0
        ? StockChangeDirection.growing
        : StockChangeDirection.falling,
      price: price,
      symbol: stockTickerSymbol,
    );
  }

  void stopTicker() {
    stockTimer.cancel();
  }
}