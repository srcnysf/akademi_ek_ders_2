import 'dart:convert';

class Diameter {
  final double meters;
  final double feet;
  Diameter({
    required this.meters,
    required this.feet,
  });

  Diameter copyWith({
    double? meters,
    double? feet,
  }) {
    return Diameter(
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

  factory Diameter.fromMap(Map<String, dynamic> map) {
    return Diameter(
      meters: map['meters']?.toDouble() ?? 0.0,
      feet: map['feet']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Diameter.fromJson(String source) => Diameter.fromMap(json.decode(source));

  @override
  String toString() => 'Diameter(meters: $meters, feet: $feet)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Diameter && other.meters == meters && other.feet == feet;
  }

  @override
  int get hashCode => meters.hashCode ^ feet.hashCode;
}
