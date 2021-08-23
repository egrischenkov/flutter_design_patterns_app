import 'package:flutter/material.dart';

import 'page_state_factory.dart';

abstract class BasePageState extends State<PageStateFactory> {

  AppBar appBar({String? title}) {
    return AppBar(
      title: Text(title ?? 'Flutter Design Patterns'),
    );
  }

  Widget buildBody();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: appBar(),
        body: buildBody(),

      ),
    );
  }

}