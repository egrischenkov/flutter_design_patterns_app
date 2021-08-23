import 'design_pattern.dart';

class DesignPatternType {
  final String id;
  final List<DesignPattern> designPatterns;

  DesignPatternType({
    required this.id,
    required this.designPatterns,
  });

  factory DesignPatternType.fromJson(Map<String, dynamic> json) {
     return DesignPatternType(
      id: json['id'] as String,
      designPatterns: json['patterns'] as List<DesignPattern>,
    );
  }
}
