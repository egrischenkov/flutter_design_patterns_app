import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'page_state_factory.dart';
import 'widgets/curved_app_bar_widget.dart';

abstract class BasePageState extends State<PageStateFactory> {

  Widget buildBody();

  Color backgroundColor() => Colors.white;

  Widget? appBar() {
    return CurvedAppBar(color: appBarColorLight, backgroundColor: backgroundColor());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            appBar() ?? SizedBox.shrink(),
            Expanded(child: buildBody()),
          ],
        ),

      ),
    );
  }

}