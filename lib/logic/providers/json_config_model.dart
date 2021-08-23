import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../../entity/json_config.dart';

import '../../utils/const.dart';

class JsonConfigModel extends ChangeNotifier {
  late final jsonConfig;

  Future<JsonConfig> init() async {
    return await rootBundle.loadString(designPatternsJsonPath).then((jsonString) {
      final jsonResponse = json.decode(jsonString);
      jsonConfig = JsonConfig.fromJson(jsonResponse);
      return jsonConfig;
    });
  }
}