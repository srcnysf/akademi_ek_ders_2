import 'dart:convert';

class Mass {
  final int kg;
  final int lb;
  Mass({
    required this.kg,
    required this.lb,
  });

  Mass copyWith({
    int? kg,
    int? lb,
  }) {
    return Mass(
      kg: kg ?? this.kg,
      lb: lb ?? this.lb,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'kg': kg,
      'lb': lb,
    };
  }

  factory Mass.fromMap(Map<String, dynamic> map) {
    return Mass(
      kg: map['kg']?.toInt() ?? 0,
      lb: map['lb']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Mass.fromJson(String source) => Mass.fromMap(json.decode(source));

  @override
  String toString() => 'Mass(kg: $kg, lb: $lb)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Mass && other.kg == kg && other.lb == lb;
  }

  @override
  int get hashCode => kg.hashCode ^ lb.hashCode;
}
