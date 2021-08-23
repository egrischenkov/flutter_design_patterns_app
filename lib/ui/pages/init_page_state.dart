import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/providers/json_config_model.dart';
import '../base_page_state.dart';

class InitPageState extends BasePageState {




  @override
  void initState() {
    context.read<JsonConfigModel>().init();
    super.initState();
  }

  @override
  Widget buildBody() {
    return Center(
      child: FlutterLogo(),
    );
  }

}
