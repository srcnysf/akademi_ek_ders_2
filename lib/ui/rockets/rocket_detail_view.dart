import 'package:akademi_ek_ders_2/helpers/price_format_extension.dart';
import 'package:flutter/material.dart';

import 'package:akademi_ek_ders_2/models/rocket.dart';

import '../../widgets/rocket_parameter_widget.dart';

class RocketDetailView extends StatelessWidget {
  Rocket rocket;
  RocketDetailView({
    Key? key,
    required this.rocket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(rocket.name, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
      ),
      body: Column(
        children: [
          Hero(tag: rocket.id, child: Image.network(rocket.flickr_images.first)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(rocket.description,
                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RocketParameterWidget(
                      title: "Height",
                      parameter: rocket.height.meters,
                    ),
                    RocketParameterWidget(
                      title: "Is Active",
                      parameter: rocket.active,
                    ),
                    RocketParameterWidget(
                      title: "Booster Count",
                      parameter: rocket.boosters,
                    ),
                    RocketParameterWidget(
                      title: "Cost Per Launch",
                      parameter: rocket.cost_per_launch.toDecimals(),
                    ),
                    RocketParameterWidget(
                      title: "First Flight",
                      parameter: rocket.first_flight,
                    ),
                    RocketParameterWidget(
                      title: "Succes Rate",
                      parameter: rocket.success_rate_pct,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
