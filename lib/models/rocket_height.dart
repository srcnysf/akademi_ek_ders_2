import 'dart:convert';

class RocketHeight {
  final double meters;
  final double feet;
  RocketHeight({
    required this.meters,
    required this.feet,
  });

  RocketHeight copyWith({
    double? meters,
    double? feet,
  }) {
    return RocketHeight(
      meters: meters ?? this.meters,
      feet: feet ?? this.feet,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'meters': meters,
      'feet': feet,
    };
  }

  factory RocketHeight.fromMap(Map<String, dynamic> map) {
    return RocketHeight(
      meters: map['meters']?.toDouble() ?? 0.0,
      feet: map['feet']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RocketHeight.fromJson(String source) => RocketHeight.fromMap(json.decode(source));
}
