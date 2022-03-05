import 'dart:convert';

import 'package:akademi_ek_ders_2/models/rocket.dart';
import 'package:akademi_ek_ders_2/ui/rockets/rocket_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RocketView extends StatefulWidget {
  const RocketView({Key? key}) : super(key: key);

  @override
  State<RocketView> createState() => _RocketViewState();
}

class _RocketViewState extends State<RocketView> {
  var url = Uri.parse('https://api.spacexdata.com/v4/rockets');
  List<Rocket>? rockets;
  getRockets() async {
    var response = await http.get(url);
    print(response.body.toString());
    setState(() {
      rockets = parseJson(response.body);
    });
  }

  List<Rocket> parseJson(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return parsed.map<Rocket>((json) => Rocket.fromMap(json)).toList();
  }

  @override
  void initState() {
    getRockets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SPACE X"),
      ),
      body: rockets == null
          ? CircularProgressIndicator()
          : ListView.separated(
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                var rocket = rockets![index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RocketDetailView(
                                rocket: rocket,
                              )),
                    );
                  },
                  title: Text(rocket.name),
                  subtitle: Text(
                    rocket.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: Hero(tag: rocket.id, child: Image.network(rocket.flickr_images.first)),
                );
              }),
              separatorBuilder: (context, int) {
                return Divider();
              },
              itemCount: rockets!.length),
    );
  }
}
