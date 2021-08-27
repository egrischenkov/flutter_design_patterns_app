import 'package:flutter/material.dart';

import '../base_page_state.dart';
import '../widgets/app_bar_widget.dart';

class MainPageState extends BasePageState {


  @override
  AppBar? appBar() {
    AppBarWidget('Main Page');
  }

  @override
  Widget buildBody() {
    return Center(
      child: Container(
        width: 60,
        height: 60,
        color: Colors.red,
      ),
    );
  }
}