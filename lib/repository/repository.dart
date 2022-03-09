import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/launcpad.dart';
import '../models/rocket.dart';

class Repository {
  static const String BASE_URL = "https://api.spacexdata.com/v4";
  var rocketsUrl = Uri.parse('$BASE_URL/rockets');
  var launchpadsUrl = Uri.parse('$BASE_URL/launchpads');

  Future<List<Rocket>> getRockets() async {
    var response = await http.get(rocketsUrl);
    return jsonDecode(response.body).map<Rocket>((json) => Rocket.fromMap(json)).toList();
  }

  Future<List<Launchpad>> getLaunchpads() async {
    var response = await http.get(launchpadsUrl);
    return jsonDecode(response.body).map<Launchpad>((json) => Launchpad.fromMap(json)).toList();
  }
}
