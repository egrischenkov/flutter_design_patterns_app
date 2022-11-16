import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'widgets/appbar/curved_app_bar_widget.dart';
import 'widgets/appbar/standard_app_bar_widget.dart';

abstract class BasePage extends StatefulWidget {
  Widget buildBody(BuildContext context);

  void init(BuildContext context, TickerProvider tickerProvider) {}

  Color? backgroundColor() => Colors.white;

  bool isCurvedAppBar() => true;

  bool isFavoritePage() => false;

  Widget? appBar(BuildContext context) {
    return isCurvedAppBar()
        ? CurvedAppBarWidget(
            title: getTitle(context)!,
            color: mainBackgroundColor,
            backgroundColor: backgroundColor()!,
          )
        : StandardAppBarWidget(
            title: getTitle(context)!,
            isFavoritePage: isFavoritePage(),
            backgroundColor: backgroundColor()!,
          );
  }

  String? getTitle(BuildContext context);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.init(context, this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.appBar(context) ?? SizedBox.shrink(),
            Expanded(child: widget.buildBody(context)),
          ],
        ),
      ),
    );
  }
}
