import 'package:akademi_ek_ders_2/helpers/price_format_extension.dart';
import 'package:akademi_ek_ders_2/models/launcpad.dart';
import 'package:flutter/material.dart';

import 'package:akademi_ek_ders_2/models/rocket.dart';

import '../../widgets/rocket_parameter_widget.dart';

class LaunchpadDetailView extends StatelessWidget {
  Launchpad launchpad;
  LaunchpadDetailView({
    Key? key,
    required this.launchpad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(launchpad.name, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
      ),
      body: Column(
        children: [
          Image.network(launchpad.images.large.first),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(launchpad.details,
                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RocketParameterWidget(
                        title: "Full Name",
                        parameter: launchpad.full_name,
                      ),
                      RocketParameterWidget(
                        title: "Launch Attempts",
                        parameter: launchpad.launch_attempts,
                      ),
                      RocketParameterWidget(
                        title: "Launch Success",
                        parameter: launchpad.launch_successes,
                      ),
                      RocketParameterWidget(
                        title: "Status",
                        parameter: launchpad.status,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
