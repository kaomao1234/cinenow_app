import 'dart:developer';

import 'package:cinenow_app/models/index.dart';
import 'package:cinenow_app/templates/seats/index.dart';
import 'package:cinenow_app/viewmodels/index.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SeatsPage extends StatefulWidget {
  const SeatsPage({super.key});

  @override
  State<SeatsPage> createState() => _SeatsPageState();
}

class _SeatsPageState extends State<SeatsPage> {
  late SeatsViewModel _viewModel;
  @override
  void initState() {
    _viewModel = SeatsViewModel(setState);
    _viewModel.tableStatus[0][1].switchReserved();
    _viewModel.tableStatus[5][3].switchReserved();
    super.initState();
  }

  void onShoppingCart() {
    Navigator.pushNamed(context, "/shopping_cart");
  }

  void onContinue() {
    Navigator.pushNamed(context, "/home");
  }

  void popPage() {
    Navigator.of(context).pop();
  }

  Widget seatColorType(String text, Color color) {
    return SizedBox(
      height: 30,
      child: ListTile(
        dense: false,
        leading: Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        title: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'Choose Seats',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: IconButton(
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            style: IconButton.styleFrom(
                iconSize: 22,
                shape: const CircleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF606060)))),
            icon: const Padding(
              padding: EdgeInsets.only(left: 0),
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFF606060),
              ),
            ),
            color: Colors.black,
            onPressed: popPage,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0), foregroundColor: Colors.black),
                onPressed: onShoppingCart,
                child: Badge(
                  label: Text(0.toString()),
                  child: Icon(
                    FluentIcons.cart_24_filled,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 10,
              ),
              const Text(
                'Screen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SeatsTable(
                  tableStatus: _viewModel.tableStatus,
                  onSelectSeat: _viewModel.onSelectSeat),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 80,
                child: Table(
                  children: [
                    TableRow(children: [
                      seatColorType("Available", Color(0xFFD9D9D9)),
                      seatColorType('Reserved', Colors.black)
                    ]),
                    TableRow(children: [
                      seatColorType('Selected', Colors.orange),
                      Container()
                    ])
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Movie: ${_viewModel.movieName}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date: ${_viewModel.date}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  Text(
                    "Session: ${_viewModel.session}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC020),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: onContinue,
                child: SizedBox(
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Continue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
