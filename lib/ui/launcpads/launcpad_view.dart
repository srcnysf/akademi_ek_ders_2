import 'dart:convert';

import 'package:akademi_ek_ders_2/models/launcpad.dart';
import 'package:akademi_ek_ders_2/models/rocket.dart';
import 'package:akademi_ek_ders_2/repository/repository.dart';
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
  List<Launchpad>? launchpads;
  Repository _repository = Repository();

  @override
  initState() {
    provideLaunchpads();
    super.initState();
  }

  provideLaunchpads() async {
    launchpads = await _repository.getLaunchpads();
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
