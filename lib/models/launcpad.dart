import 'dart:convert';

import 'package:flutter/foundation.dart';

class Launchpad {
  final Images images;
  final String name;
  final String full_name;
  final String locality;
  final String region;
  final double latitude;
  final double longitude;
  final int launch_attempts;
  final int launch_successes;
  final List<String> rockets;
  final String timezone;
  final List<dynamic> launches;
  final String status;
  final String details;
  final String id;
  Launchpad({
    required this.images,
    required this.name,
    required this.full_name,
    required this.locality,
    required this.region,
    required this.latitude,
    required this.longitude,
    required this.launch_attempts,
    required this.launch_successes,
    required this.rockets,
    required this.timezone,
    required this.launches,
    required this.status,
    required this.details,
    required this.id,
  });

  Launchpad copyWith({
    Images? images,
    String? name,
    String? full_name,
    String? locality,
    String? region,
    double? latitude,
    double? longitude,
    int? launch_attempts,
    int? launch_successes,
    List<String>? rockets,
    String? timezone,
    List<dynamic>? launches,
    String? status,
    String? details,
    String? id,
  }) {
    return Launchpad(
      images: images ?? this.images,
      name: name ?? this.name,
      full_name: full_name ?? this.full_name,
      locality: locality ?? this.locality,
      region: region ?? this.region,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      launch_attempts: launch_attempts ?? this.launch_attempts,
      launch_successes: launch_successes ?? this.launch_successes,
      rockets: rockets ?? this.rockets,
      timezone: timezone ?? this.timezone,
      launches: launches ?? this.launches,
      status: status ?? this.status,
      details: details ?? this.details,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'images': images.toMap(),
      'name': name,
      'full_name': full_name,
      'locality': locality,
      'region': region,
      'latitude': latitude,
      'longitude': longitude,
      'launch_attempts': launch_attempts,
      'launch_successes': launch_successes,
      'rockets': rockets,
      'timezone': timezone,
      'launches': launches,
      'status': status,
      'details': details,
      'id': id,
    };
  }

  factory Launchpad.fromMap(Map<String, dynamic> map) {
    return Launchpad(
      images: Images.fromMap(map['images']),
      name: map['name'] ?? '',
      full_name: map['full_name'] ?? '',
      locality: map['locality'] ?? '',
      region: map['region'] ?? '',
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      launch_attempts: map['launch_attempts']?.toInt() ?? 0,
      launch_successes: map['launch_successes']?.toInt() ?? 0,
      rockets: List<String>.from(map['rockets']),
      timezone: map['timezone'] ?? '',
      launches: List<dynamic>.from(map['launches']),
      status: map['status'] ?? '',
      details: map['details'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Launchpad.fromJson(String source) => Launchpad.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Launcpad(images: $images, name: $name, full_name: $full_name, locality: $locality, region: $region, latitude: $latitude, longitude: $longitude, launch_attempts: $launch_attempts, launch_successes: $launch_successes, rockets: $rockets, timezone: $timezone, launches: $launches, status: $status, details: $details, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Launchpad &&
        other.images == images &&
        other.name == name &&
        other.full_name == full_name &&
        other.locality == locality &&
        other.region == region &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.launch_attempts == launch_attempts &&
        other.launch_successes == launch_successes &&
        listEquals(other.rockets, rockets) &&
        other.timezone == timezone &&
        listEquals(other.launches, launches) &&
        other.status == status &&
        other.details == details &&
        other.id == id;
  }

  @override
  int get hashCode {
    return images.hashCode ^
        name.hashCode ^
        full_name.hashCode ^
        locality.hashCode ^
        region.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        launch_attempts.hashCode ^
        launch_successes.hashCode ^
        rockets.hashCode ^
        timezone.hashCode ^
        launches.hashCode ^
        status.hashCode ^
        details.hashCode ^
        id.hashCode;
  }
}

class Images {
  final List<String> large;
  Images({
    required this.large,
  });

  Images copyWith({
    List<String>? large,
  }) {
    return Images(
      large: large ?? this.large,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'large': large,
    };
  }

  factory Images.fromMap(Map<String, dynamic> map) {
    return Images(
      large: List<String>.from(map['large']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Images.fromJson(String source) => Images.fromMap(json.decode(source));

  @override
  String toString() => 'Images(large: $large)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Images && listEquals(other.large, large);
  }

  @override
  int get hashCode => large.hashCode;
}
