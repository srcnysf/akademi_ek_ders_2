import 'dart:convert';

import 'package:akademi_ek_ders_2/models/diameter.dart';
import 'package:akademi_ek_ders_2/models/mass.dart';
import 'package:akademi_ek_ders_2/models/rocket_height.dart';

class Rocket {
  final RocketHeight height;
  final Diameter diameter;
  final Mass mass;
  final First_stage first_stage;
  final Second_stage second_stage;
  final Engines engines;
  final Landing_legs landing_legs;
  final List<Payload_weight> payload_weights;
  final List<String> flickr_images;
  final String name;
  final String type;
  final bool active;
  final int stages;
  final int boosters;
  final int cost_per_launch;
  final int success_rate_pct;
  final String first_flight;
  final String country;
  final String company;
  final String wikipedia;
  final String description;
  final String id;
  Rocket({
    required this.height,
    required this.diameter,
    required this.mass,
    required this.first_stage,
    required this.second_stage,
    required this.engines,
    required this.landing_legs,
    required this.payload_weights,
    required this.flickr_images,
    required this.name,
    required this.type,
    required this.active,
    required this.stages,
    required this.boosters,
    required this.cost_per_launch,
    required this.success_rate_pct,
    required this.first_flight,
    required this.country,
    required this.company,
    required this.wikipedia,
    required this.description,
    required this.id,
  });

  Rocket copyWith({
    RocketHeight? height,
    Diameter? diameter,
    Mass? mass,
    First_stage? first_stage,
    Second_stage? second_stage,
    Engines? engines,
    Landing_legs? landing_legs,
    List<Payload_weight>? payload_weights,
    List<String>? flickr_images,
    String? name,
    String? type,
    bool? active,
    int? stages,
    int? boosters,
    int? cost_per_launch,
    int? success_rate_pct,
    String? first_flight,
    String? country,
    String? company,
    String? wikipedia,
    String? description,
    String? id,
  }) {
    return Rocket(
      height: height ?? this.height,
      diameter: diameter ?? this.diameter,
      mass: mass ?? this.mass,
      first_stage: first_stage ?? this.first_stage,
      second_stage: second_stage ?? this.second_stage,
      engines: engines ?? this.engines,
      landing_legs: landing_legs ?? this.landing_legs,
      payload_weights: payload_weights ?? this.payload_weights,
      flickr_images: flickr_images ?? this.flickr_images,
      name: name ?? this.name,
      type: type ?? this.type,
      active: active ?? this.active,
      stages: stages ?? this.stages,
      boosters: boosters ?? this.boosters,
      cost_per_launch: cost_per_launch ?? this.cost_per_launch,
      success_rate_pct: success_rate_pct ?? this.success_rate_pct,
      first_flight: first_flight ?? this.first_flight,
      country: country ?? this.country,
      company: company ?? this.company,
      wikipedia: wikipedia ?? this.wikipedia,
      description: description ?? this.description,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'height': height.toMap(),
      'diameter': diameter.toMap(),
      'mass': mass.toMap(),
      'first_stage': first_stage.toMap(),
      'second_stage': second_stage.toMap(),
      'engines': engines.toMap(),
      'landing_legs': landing_legs.toMap(),
      'payload_weights': payload_weights.map((x) => x.toMap()).toList(),
      'flickr_images': flickr_images,
      'name': name,
      'type': type,
      'active': active,
      'stages': stages,
      'boosters': boosters,
      'cost_per_launch': cost_per_launch,
      'success_rate_pct': success_rate_pct,
      'first_flight': first_flight,
      'country': country,
      'company': company,
      'wikipedia': wikipedia,
      'description': description,
      'id': id,
    };
  }

  factory Rocket.fromMap(Map<String, dynamic> map) {
    return Rocket(
      height: RocketHeight.fromMap(map['height']),
      diameter: Diameter.fromMap(map['diameter']),
      mass: Mass.fromMap(map['mass']),
      first_stage: First_stage.fromMap(map['first_stage']),
      second_stage: Second_stage.fromMap(map['second_stage']),
      engines: Engines.fromMap(map['engines']),
      landing_legs: Landing_legs.fromMap(map['landing_legs']),
      payload_weights: List<Payload_weight>.from(map['payload_weights']?.map((x) => Payload_weight.fromMap(x))),
      flickr_images: List<String>.from(map['flickr_images']),
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      active: map['active'] ?? false,
      stages: map['stages']?.toInt() ?? 0,
      boosters: map['boosters']?.toInt() ?? 0,
      cost_per_launch: map['cost_per_launch']?.toInt() ?? 0,
      success_rate_pct: map['success_rate_pct']?.toInt() ?? 0,
      first_flight: map['first_flight'] ?? '',
      country: map['country'] ?? '',
      company: map['company'] ?? '',
      wikipedia: map['wikipedia'] ?? '',
      description: map['description'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Rocket.fromJson(String source) => Rocket.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Rocket(height: $height, diameter: $diameter, mass: $mass, first_stage: $first_stage, second_stage: $second_stage, engines: $engines, landing_legs: $landing_legs, payload_weights: $payload_weights, flickr_images: $flickr_images, name: $name, type: $type, active: $active, stages: $stages, boosters: $boosters, cost_per_launch: $cost_per_launch, success_rate_pct: $success_rate_pct, first_flight: $first_flight, country: $country, company: $company, wikipedia: $wikipedia, description: $description, id: $id)';
  }
}

class Height {
  final double meters;
  final int feet;
  Height({
    required this.meters,
    required this.feet,
  });

  Map<String, dynamic> toMap() {
    return {
      'meters': meters,
      'feet': feet,
    };
  }

  factory Height.fromMap(Map<String, dynamic> map) {
    return Height(
      meters: map['meters']?.toDouble() ?? 0.0,
      feet: map['feet']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Height.fromJson(String source) => Height.fromMap(json.decode(source));

  @override
  String toString() => 'Height(meters: $meters, feet: $feet)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Height && other.meters == meters && other.feet == feet;
  }

  @override
  int get hashCode => meters.hashCode ^ feet.hashCode;
}

class First_stage {
  final Thrust_sea_level thrust_sea_level;
  final Thrust_vacuum thrust_vacuum;
  final bool reusable;
  final int engines;
  final double fuel_amount_tons;
  final int burn_time_sec;
  First_stage({
    required this.thrust_sea_level,
    required this.thrust_vacuum,
    required this.reusable,
    required this.engines,
    required this.fuel_amount_tons,
    required this.burn_time_sec,
  });

  First_stage copyWith({
    Thrust_sea_level? thrust_sea_level,
    Thrust_vacuum? thrust_vacuum,
    bool? reusable,
    int? engines,
    double? fuel_amount_tons,
    int? burn_time_sec,
  }) {
    return First_stage(
      thrust_sea_level: thrust_sea_level ?? this.thrust_sea_level,
      thrust_vacuum: thrust_vacuum ?? this.thrust_vacuum,
      reusable: reusable ?? this.reusable,
      engines: engines ?? this.engines,
      fuel_amount_tons: fuel_amount_tons ?? this.fuel_amount_tons,
      burn_time_sec: burn_time_sec ?? this.burn_time_sec,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'thrust_sea_level': thrust_sea_level.toMap(),
      'thrust_vacuum': thrust_vacuum.toMap(),
      'reusable': reusable,
      'engines': engines,
      'fuel_amount_tons': fuel_amount_tons,
      'burn_time_sec': burn_time_sec,
    };
  }

  factory First_stage.fromMap(Map<String, dynamic> map) {
    return First_stage(
      thrust_sea_level: Thrust_sea_level.fromMap(map['thrust_sea_level']),
      thrust_vacuum: Thrust_vacuum.fromMap(map['thrust_vacuum']),
      reusable: map['reusable'] ?? false,
      engines: map['engines']?.toInt() ?? 0,
      fuel_amount_tons: map['fuel_amount_tons']?.toDouble() ?? 0.0,
      burn_time_sec: map['burn_time_sec']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory First_stage.fromJson(String source) => First_stage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'First_stage(thrust_sea_level: $thrust_sea_level, thrust_vacuum: $thrust_vacuum, reusable: $reusable, engines: $engines, fuel_amount_tons: $fuel_amount_tons, burn_time_sec: $burn_time_sec)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is First_stage &&
        other.thrust_sea_level == thrust_sea_level &&
        other.thrust_vacuum == thrust_vacuum &&
        other.reusable == reusable &&
        other.engines == engines &&
        other.fuel_amount_tons == fuel_amount_tons &&
        other.burn_time_sec == burn_time_sec;
  }

  @override
  int get hashCode {
    return thrust_sea_level.hashCode ^
        thrust_vacuum.hashCode ^
        reusable.hashCode ^
        engines.hashCode ^
        fuel_amount_tons.hashCode ^
        burn_time_sec.hashCode;
  }
}

class Thrust_sea_level {
  final int kN;
  final int lbf;
  Thrust_sea_level({
    required this.kN,
    required this.lbf,
  });

  Thrust_sea_level copyWith({
    int? kN,
    int? lbf,
  }) {
    return Thrust_sea_level(
      kN: kN ?? this.kN,
      lbf: lbf ?? this.lbf,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'kN': kN,
      'lbf': lbf,
    };
  }

  factory Thrust_sea_level.fromMap(Map<String, dynamic> map) {
    return Thrust_sea_level(
      kN: map['kN']?.toInt() ?? 0,
      lbf: map['lbf']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Thrust_sea_level.fromJson(String source) => Thrust_sea_level.fromMap(json.decode(source));

  @override
  String toString() => 'Thrust_sea_level(kN: $kN, lbf: $lbf)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Thrust_sea_level && other.kN == kN && other.lbf == lbf;
  }

  @override
  int get hashCode => kN.hashCode ^ lbf.hashCode;
}

class Thrust_vacuum {
  final int kN;
  final int lbf;
  Thrust_vacuum({
    required this.kN,
    required this.lbf,
  });

  Thrust_vacuum copyWith({
    int? kN,
    int? lbf,
  }) {
    return Thrust_vacuum(
      kN: kN ?? this.kN,
      lbf: lbf ?? this.lbf,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'kN': kN,
      'lbf': lbf,
    };
  }

  factory Thrust_vacuum.fromMap(Map<String, dynamic> map) {
    return Thrust_vacuum(
      kN: map['kN']?.toInt() ?? 0,
      lbf: map['lbf']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Thrust_vacuum.fromJson(String source) => Thrust_vacuum.fromMap(json.decode(source));

  @override
  String toString() => 'Thrust_vacuum(kN: $kN, lbf: $lbf)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Thrust_vacuum && other.kN == kN && other.lbf == lbf;
  }

  @override
  int get hashCode => kN.hashCode ^ lbf.hashCode;
}

class Second_stage {
  final Thrust thrust;
  final Payloads payloads;
  final bool reusable;
  final int engines;
  final double fuel_amount_tons;
  final int burn_time_sec;
  Second_stage({
    required this.thrust,
    required this.payloads,
    required this.reusable,
    required this.engines,
    required this.fuel_amount_tons,
    required this.burn_time_sec,
  });

  Second_stage copyWith({
    Thrust? thrust,
    Payloads? payloads,
    bool? reusable,
    int? engines,
    double? fuel_amount_tons,
    int? burn_time_sec,
  }) {
    return Second_stage(
      thrust: thrust ?? this.thrust,
      payloads: payloads ?? this.payloads,
      reusable: reusable ?? this.reusable,
      engines: engines ?? this.engines,
      fuel_amount_tons: fuel_amount_tons ?? this.fuel_amount_tons,
      burn_time_sec: burn_time_sec ?? this.burn_time_sec,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'thrust': thrust.toMap(),
      'payloads': payloads.toMap(),
      'reusable': reusable,
      'engines': engines,
      'fuel_amount_tons': fuel_amount_tons,
      'burn_time_sec': burn_time_sec,
    };
  }

  factory Second_stage.fromMap(Map<String, dynamic> map) {
    return Second_stage(
      thrust: Thrust.fromMap(map['thrust']),
      payloads: Payloads.fromMap(map['payloads']),
      reusable: map['reusable'] ?? false,
      engines: map['engines']?.toInt() ?? 0,
      fuel_amount_tons: map['fuel_amount_tons']?.toDouble() ?? 0.0,
      burn_time_sec: map['burn_time_sec']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Second_stage.fromJson(String source) => Second_stage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Second_stage(thrust: $thrust, payloads: $payloads, reusable: $reusable, engines: $engines, fuel_amount_tons: $fuel_amount_tons, burn_time_sec: $burn_time_sec)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Second_stage &&
        other.thrust == thrust &&
        other.payloads == payloads &&
        other.reusable == reusable &&
        other.engines == engines &&
        other.fuel_amount_tons == fuel_amount_tons &&
        other.burn_time_sec == burn_time_sec;
  }

  @override
  int get hashCode {
    return thrust.hashCode ^
        payloads.hashCode ^
        reusable.hashCode ^
        engines.hashCode ^
        fuel_amount_tons.hashCode ^
        burn_time_sec.hashCode;
  }
}

class Thrust {
  final int kN;
  final int lbf;
  Thrust({
    required this.kN,
    required this.lbf,
  });

  Thrust copyWith({
    int? kN,
    int? lbf,
  }) {
    return Thrust(
      kN: kN ?? this.kN,
      lbf: lbf ?? this.lbf,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'kN': kN,
      'lbf': lbf,
    };
  }

  factory Thrust.fromMap(Map<String, dynamic> map) {
    return Thrust(
      kN: map['kN']?.toInt() ?? 0,
      lbf: map['lbf']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Thrust.fromJson(String source) => Thrust.fromMap(json.decode(source));

  @override
  String toString() => 'Thrust(kN: $kN, lbf: $lbf)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Thrust && other.kN == kN && other.lbf == lbf;
  }

  @override
  int get hashCode => kN.hashCode ^ lbf.hashCode;
}

class Payloads {
  final Composite_fairing composite_fairing;
  final String option_1;
  Payloads({
    required this.composite_fairing,
    required this.option_1,
  });

  Payloads copyWith({
    Composite_fairing? composite_fairing,
    String? option_1,
  }) {
    return Payloads(
      composite_fairing: composite_fairing ?? this.composite_fairing,
      option_1: option_1 ?? this.option_1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'composite_fairing': composite_fairing.toMap(),
      'option_1': option_1,
    };
  }

  factory Payloads.fromMap(Map<String, dynamic> map) {
    return Payloads(
      composite_fairing: Composite_fairing.fromMap(map['composite_fairing']),
      option_1: map['option_1'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Payloads.fromJson(String source) => Payloads.fromMap(json.decode(source));

  @override
  String toString() => 'Payloads(composite_fairing: $composite_fairing, option_1: $option_1)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Payloads && other.composite_fairing == composite_fairing && other.option_1 == option_1;
  }

  @override
  int get hashCode => composite_fairing.hashCode ^ option_1.hashCode;
}

class Composite_fairing {
  final Height height;
  final Diameter diameter;
  Composite_fairing({
    required this.height,
    required this.diameter,
  });

  Composite_fairing copyWith({
    Height? height,
    Diameter? diameter,
  }) {
    return Composite_fairing(
      height: height ?? this.height,
      diameter: diameter ?? this.diameter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'height': height.toMap(),
      'diameter': diameter.toMap(),
    };
  }

  factory Composite_fairing.fromMap(Map<String, dynamic> map) {
    return Composite_fairing(
      height: Height.fromMap(map['height']),
      diameter: Diameter.fromMap(map['diameter']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Composite_fairing.fromJson(String source) => Composite_fairing.fromMap(json.decode(source));

  @override
  String toString() => 'Composite_fairing(height: $height, diameter: $diameter)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Composite_fairing && other.height == height && other.diameter == diameter;
  }

  @override
  int get hashCode => height.hashCode ^ diameter.hashCode;
}

class Engines {
  final Isp isp;
  final Thrust_sea_level thrust_sea_level;
  final Thrust_vacuum thrust_vacuum;
  final int number;
  final String type;
  final String version;
  final String layout;
  final int engine_loss_max;
  final String propellant_1;
  final String propellant_2;
  final int thrust_to_weight;
  Engines({
    required this.isp,
    required this.thrust_sea_level,
    required this.thrust_vacuum,
    required this.number,
    required this.type,
    required this.version,
    required this.layout,
    required this.engine_loss_max,
    required this.propellant_1,
    required this.propellant_2,
    required this.thrust_to_weight,
  });

  Engines copyWith({
    Isp? isp,
    Thrust_sea_level? thrust_sea_level,
    Thrust_vacuum? thrust_vacuum,
    int? number,
    String? type,
    String? version,
    String? layout,
    int? engine_loss_max,
    String? propellant_1,
    String? propellant_2,
    int? thrust_to_weight,
  }) {
    return Engines(
      isp: isp ?? this.isp,
      thrust_sea_level: thrust_sea_level ?? this.thrust_sea_level,
      thrust_vacuum: thrust_vacuum ?? this.thrust_vacuum,
      number: number ?? this.number,
      type: type ?? this.type,
      version: version ?? this.version,
      layout: layout ?? this.layout,
      engine_loss_max: engine_loss_max ?? this.engine_loss_max,
      propellant_1: propellant_1 ?? this.propellant_1,
      propellant_2: propellant_2 ?? this.propellant_2,
      thrust_to_weight: thrust_to_weight ?? this.thrust_to_weight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isp': isp.toMap(),
      'thrust_sea_level': thrust_sea_level.toMap(),
      'thrust_vacuum': thrust_vacuum.toMap(),
      'number': number,
      'type': type,
      'version': version,
      'layout': layout,
      'engine_loss_max': engine_loss_max,
      'propellant_1': propellant_1,
      'propellant_2': propellant_2,
      'thrust_to_weight': thrust_to_weight,
    };
  }

  factory Engines.fromMap(Map<String, dynamic> map) {
    return Engines(
      isp: Isp.fromMap(map['isp']),
      thrust_sea_level: Thrust_sea_level.fromMap(map['thrust_sea_level']),
      thrust_vacuum: Thrust_vacuum.fromMap(map['thrust_vacuum']),
      number: map['number']?.toInt() ?? 0,
      type: map['type'] ?? '',
      version: map['version'] ?? '',
      layout: map['layout'] ?? '',
      engine_loss_max: map['engine_loss_max']?.toInt() ?? 0,
      propellant_1: map['propellant_1'] ?? '',
      propellant_2: map['propellant_2'] ?? '',
      thrust_to_weight: map['thrust_to_weight']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Engines.fromJson(String source) => Engines.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Engines(isp: $isp, thrust_sea_level: $thrust_sea_level, thrust_vacuum: $thrust_vacuum, number: $number, type: $type, version: $version, layout: $layout, engine_loss_max: $engine_loss_max, propellant_1: $propellant_1, propellant_2: $propellant_2, thrust_to_weight: $thrust_to_weight)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Engines &&
        other.isp == isp &&
        other.thrust_sea_level == thrust_sea_level &&
        other.thrust_vacuum == thrust_vacuum &&
        other.number == number &&
        other.type == type &&
        other.version == version &&
        other.layout == layout &&
        other.engine_loss_max == engine_loss_max &&
        other.propellant_1 == propellant_1 &&
        other.propellant_2 == propellant_2 &&
        other.thrust_to_weight == thrust_to_weight;
  }

  @override
  int get hashCode {
    return isp.hashCode ^
        thrust_sea_level.hashCode ^
        thrust_vacuum.hashCode ^
        number.hashCode ^
        type.hashCode ^
        version.hashCode ^
        layout.hashCode ^
        engine_loss_max.hashCode ^
        propellant_1.hashCode ^
        propellant_2.hashCode ^
        thrust_to_weight.hashCode;
  }
}

class Isp {
  final int sea_level;
  final int vacuum;
  Isp({
    required this.sea_level,
    required this.vacuum,
  });

  Isp copyWith({
    int? sea_level,
    int? vacuum,
  }) {
    return Isp(
      sea_level: sea_level ?? this.sea_level,
      vacuum: vacuum ?? this.vacuum,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sea_level': sea_level,
      'vacuum': vacuum,
    };
  }

  factory Isp.fromMap(Map<String, dynamic> map) {
    return Isp(
      sea_level: map['sea_level']?.toInt() ?? 0,
      vacuum: map['vacuum']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Isp.fromJson(String source) => Isp.fromMap(json.decode(source));

  @override
  String toString() => 'Isp(sea_level: $sea_level, vacuum: $vacuum)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Isp && other.sea_level == sea_level && other.vacuum == vacuum;
  }

  @override
  int get hashCode => sea_level.hashCode ^ vacuum.hashCode;
}

class Landing_legs {
  final int number;
  Landing_legs({
    required this.number,
  });

  Landing_legs copyWith({
    int? number,
  }) {
    return Landing_legs(
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
    };
  }

  factory Landing_legs.fromMap(Map<String, dynamic> map) {
    return Landing_legs(
      number: map['number']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Landing_legs.fromJson(String source) => Landing_legs.fromMap(json.decode(source));
}

class Payload_weight {
  final String id;
  final String name;
  final int kg;
  final int lb;
  Payload_weight({
    required this.id,
    required this.name,
    required this.kg,
    required this.lb,
  });

  Payload_weight copyWith({
    String? id,
    String? name,
    int? kg,
    int? lb,
  }) {
    return Payload_weight(
      id: id ?? this.id,
      name: name ?? this.name,
      kg: kg ?? this.kg,
      lb: lb ?? this.lb,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'kg': kg,
      'lb': lb,
    };
  }

  factory Payload_weight.fromMap(Map<String, dynamic> map) {
    return Payload_weight(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      kg: map['kg']?.toInt() ?? 0,
      lb: map['lb']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Payload_weight.fromJson(String source) => Payload_weight.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Payload_weight(id: $id, name: $name, kg: $kg, lb: $lb)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Payload_weight && other.id == id && other.name == name && other.kg == kg && other.lb == lb;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ kg.hashCode ^ lb.hashCode;
  }
}
