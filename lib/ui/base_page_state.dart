import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'page_state_factory.dart';
import 'widgets/appbar/curved_app_bar_widget.dart';
import 'widgets/appbar/standard_app_bar_widget.dart';

abstract class BasePageState extends State<PageStateFactory> {
  Widget buildBody(BuildContext context);

  Color? backgroundColor() => Colors.white;

  bool isCurvedAppBar() => true;

  String? getTitle();

  bool isFavoritePage() => false;

  Widget? appBar() {
    return isCurvedAppBar()
        ? CurvedAppBarWidget(
            title: getTitle()!,
            color: appBarColorLight,
            backgroundColor: backgroundColor()!,
          )
        : StandardAppBarWidget(
            backgroundColor: backgroundColor()!,
            title: getTitle()!,
            isFavoritePage: isFavoritePage(),
          );
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
            appBar() ?? SizedBox.shrink(),
            Expanded(child: buildBody(context)),
          ],
        ),
      ),
    );
  }
}
