import 'package:akademi_ek_ders_2/ui/main_view.dart';
import 'package:akademi_ek_ders_2/ui/rockets/rockets_view.dart';
import 'package:akademi_ek_ders_2/widgets/used_widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Akademi Ek Ders 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainView(),
    );
  }
}
