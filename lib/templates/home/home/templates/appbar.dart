import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  void Function() onShoppingCart;
  int badgeNumber;

  HomeAppBar(
      {required this.badgeNumber, required this.onShoppingCart, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        'Movies',
        style: TextStyle(
          color: Color(0xFFF2F2F2),
          fontSize: 21,
          fontWeight: FontWeight.w500,
        ),
      ),
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: TextButton(
            style: TextButton.styleFrom(
                padding: EdgeInsets.all(0), foregroundColor: Colors.black),
            onPressed: onShoppingCart,
            child: Badge(
              label: Text(badgeNumber.toString()),
              child: Icon(
                FluentIcons.cart_24_filled,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
