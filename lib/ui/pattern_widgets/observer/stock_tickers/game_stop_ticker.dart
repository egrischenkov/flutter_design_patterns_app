import 'dart:async';

import '../stock_ticker_symbol.dart';
import 'stock_ticker.dart';

class GameStockTicker extends StockTicker {
  GameStockTicker() {
    title = StockTickerSymbol.GME.toShortString();
    stockTimer = Timer.periodic(
      const Duration(seconds: 2),
      (_) {
        setStock(StockTickerSymbol.GME, 16000, 20000);
        notifySubscribers();
      },
    );
  }
}
