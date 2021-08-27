import 'package:flutter/material.dart';
import '../../entity/design_pattern.dart';

import '../base_page_state.dart';

class DetailsPageState extends BasePageState {
  final DesignPattern designPattern;
  final Widget innerWidget;

  DetailsPageState({required this.designPattern, required this.innerWidget});

  @override
  AppBar? appBar() {
    return null;
  }

  @override
  Widget buildBody() {
    // TODO: implement buildBody
    throw UnimplementedError();
  }

}