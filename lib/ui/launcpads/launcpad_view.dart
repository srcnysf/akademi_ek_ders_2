import 'dart:convert';

import 'package:akademi_ek_ders_2/models/launcpad.dart';
import 'package:akademi_ek_ders_2/models/rocket.dart';
import 'package:akademi_ek_ders_2/ui/launcpads/launcpad_detail.dart';
import 'package:akademi_ek_ders_2/ui/rockets/rocket_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LaunchpadView extends StatefulWidget {
  const LaunchpadView({Key? key}) : super(key: key);

  @override
  State<LaunchpadView> createState() => _LaunchpadViewState();
}

class _LaunchpadViewState extends State<LaunchpadView> {
  var url = Uri.parse('https://api.spacexdata.com/v4/launchpads');
  List<Launchpad>? launchpads;
  getRockets() async {
    var response = await http.get(url);
    print(response.body.toString());
    setState(() {
      launchpads = parseJson(response.body);
    });
  }

  List<Launchpad> parseJson(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return parsed.map<Launchpad>((json) => Launchpad.fromMap(json)).toList();
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
      body: launchpads == null
          ? CircularProgressIndicator()
          : ListView.separated(
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                var launchpad = launchpads![index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LaunchpadDetailView(
                                launchpad: launchpad,
                              )),
                    );
                  },
                  title: Text(launchpad.name),
                  subtitle: Text(
                    launchpad.details,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: Container(
                    child: Image.network(
                      launchpad.images.large.first,
                      fit: BoxFit.cover,
                      width: 100,
                    ),
                  ),
                );
              }),
              separatorBuilder: (context, int) {
                return Divider();
              },
              itemCount: launchpads!.length),
    );
  }
}
