import 'package:akademi_ek_ders_2/ui/launcpads/launcpad_view.dart';
import 'package:akademi_ek_ders_2/ui/rockets/rockets_view.dart';
import 'package:flutter/material.dart';

import 'missions/misson_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(index: activePage, children: [
          RocketView(),
          LaunchpadView(),
          MissionView(),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: activePage,
          onTap: (int) {
            setState(() {
              activePage = int;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.rocket), label: "Rockets"),
            BottomNavigationBarItem(icon: Icon(Icons.launch), label: "Launcpads"),
            BottomNavigationBarItem(icon: Icon(Icons.rocket_launch), label: "Missions")
          ],
        ));
  }
}
