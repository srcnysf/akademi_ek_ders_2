import 'package:flutter/material.dart';

class RocketParameterWidget extends StatelessWidget {
  dynamic parameter;
  String title;
  RocketParameterWidget({
    Key? key,
    required this.parameter,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: '$title:',
            style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
            children: <TextSpan>[
              TextSpan(
                  text: ' $parameter', style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
