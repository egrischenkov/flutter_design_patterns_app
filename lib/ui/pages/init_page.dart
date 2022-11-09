import 'package:flutter/material.dart';

import '../../initializer.dart';
import '../../utils/app_colors.dart';
import '../base_page.dart';

class InitPage extends BasePage {
  final Initializer _initializer = Initializer();

  @override
  void init(BuildContext context, TickerProvider tickerProvider) {
    _initializer.init(context);
  }

  Color? backgroundColor() => mainBackgroundColor;

  @override
  Widget? appBar(BuildContext context) => null;

  @override
  String? getTitle(BuildContext context) => null;

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      color: mainBackgroundColor,
    );
  }
}
