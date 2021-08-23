class DesignPattern {
  final String id;
  final String route;

  DesignPattern({required this.id, required this.route});

  factory DesignPattern.fromJson(Map<String, dynamic> json) {
    return DesignPattern(
      id: json['id'] as String,
      route: json['route'] as String,
    );
  }
}
