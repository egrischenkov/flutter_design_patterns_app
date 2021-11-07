import 'package:flutter/material.dart';

import '../../initializer.dart';
import '../../utils/app_colors.dart';
import '../base_page_state.dart';

class InitPageState extends BasePageState {
  final Initializer _initializer = Initializer();

  @override
  void initState() {
    _initializer.init(context);
    super.initState();
  }

  Color? backgroundColor() => mainPageBackgroundColorLight;

  @override
  Widget? appBar() => null;

  @override
  String? getTitle() => null;

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      color: mainPageBackgroundColorLight,
    );
  }
}
