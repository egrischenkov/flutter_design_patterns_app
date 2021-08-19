import 'package:yaml/yaml.dart';
import 'dart:io';

void main() {
  File f = new File("pubspec.yaml");
  f.readAsString().then((String text) {
    Map yaml = loadYaml(text);
    print(yaml['version']);
  });
}