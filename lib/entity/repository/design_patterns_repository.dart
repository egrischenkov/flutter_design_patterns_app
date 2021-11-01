import 'dart:convert';
import 'package:flutter/services.dart';

import '../../utils/const.dart';
import '../json_config.dart';

class DesignPatternsRepository {
  Future<JsonConfig> init() async {
    return await rootBundle.loadString(designPatternsJsonPath).then((jsonString) {
      final jsonResponse = json.decode(jsonString);
      return JsonConfig.fromJson(jsonResponse);
    });
  }
}