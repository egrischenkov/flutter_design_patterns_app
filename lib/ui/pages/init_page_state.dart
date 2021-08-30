import 'package:flutter/material.dart';

import '../../entity/helpers/design_patterns_repository.dart';
import '../../logic/navigation/app_router.dart';
import '../../utils/utils.dart';
import '../base_page_state.dart';

class InitPageState extends BasePageState {
  late DesignPatternsRepository repository;

  @override
  void initState() {
    repository = DesignPatternsRepository();
    repository.init().then((patternsConfig) {
      final patternTypes = patternsConfig.patternTypes;
      navigate(Navigation.mainRoute, replace: true, argument: patternTypes);
    });
    super.initState();
  }

  @override
  Widget? appBar() => null;

  @override
  String? getTitle() => null;

  @override
  Widget buildBody() {
    return Center(
      child: FlutterLogo(),
    );
  }
}
