import 'package:flutter/material.dart';
import '../../entity/design_pattern_type.dart';
import '../base_page_state.dart';

class CategoryPageState extends BasePageState {
  final DesignPatternType designPatternType;

  @override
  Color backgroundColor() => Colors.blue;

  CategoryPageState({required this.designPatternType});

  @override
  Widget buildBody() {
    // TODO: implement buildBody
    throw UnimplementedError();
  }
}