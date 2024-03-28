import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../templates/home/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  int selectedBody = 0;
  final List<Widget> _list = [
    new HomeBody(),
    new AccountBody(),
    new TicketBody()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _list.elementAt(selectedBody),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              selectedBody = 2;
            });
          },
          backgroundColor: const Color(0xFF121212),
          shape: const CircleBorder(side: BorderSide(color: Color(0xFF181818))),
          child: RotatedBox(
            quarterTurns: 1,
            child: Icon(
              FluentIcons.ticket_horizontal_24_filled,
              color: selectedBody == 2 ? Colors.amber : Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.black,
        selectedItemColor: selectedBody == 2 ? Colors.white : Colors.amber,
        unselectedItemColor: Colors.white,
        onTap: (int? val) {
          setState(() {
            selectedIndex = val!;
            selectedBody = val!;
          });
        },
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 30,
              ),
              label: ""),
          const BottomNavigationBarItem(
              icon: Icon(
                FluentIcons.person_12_filled,
                size: 30,
              ),
              label: ""),
        ],
      ),
    );
  }
}
