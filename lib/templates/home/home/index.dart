import 'dart:developer';
import 'package:cinenow_app/templates/home/home/templates/index.dart';
import 'package:cinenow_app/templates/home/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int numItems = 0;
  void onShoppingCart() {
    Navigator.pushNamed(context, "/shopping_cart");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child:
            HomeAppBar(badgeNumber: numItems, onShoppingCart: onShoppingCart),
        preferredSize: const Size.fromHeight(56),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              HomeBanner(
                  title: "The Batman",
                  subTitle: "Get your tickets now",
                  imgSrc: "assets/images/the_batman_banner.png"),
              HomeTabs()
            ],
          ),
        ),
      ),
    );
  }
}
