import 'package:cinenow_app/components/index.dart';
import 'package:cinenow_app/utils/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  late AdaptiveSize _adaptiveSize;
  @override
  void initState() {
    _adaptiveSize = AdaptiveSize(context);
    // TODO: implement initState
    super.initState();
  }

  void onTap() {
    Navigator.of(context).pushNamed("/movie");
  }

  Widget onTheater() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Text(
            'Available today',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        GridView.count(
          childAspectRatio: 0.85,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          shrinkWrap: true,
          children: [
            MovieCard(
              title: "StarWars",
              imageSrc: "assets/images/star_wars_logo_new_tall.png",
              onTap: onTap,
            ),
            MovieCard(
                title: "StarWars",
                imageSrc: "assets/images/star_wars_logo_new_tall.png",
                onTap: onTap),
            MovieCard(
                title: "StarWars",
                imageSrc: "assets/images/star_wars_logo_new_tall.png",
                onTap: onTap)
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _adaptiveSize.getHeightPercent(100),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
            bottom: TabBar(
                indicatorColor: Colors.amber,
                dividerColor: Colors.transparent,
                overlayColor: MaterialStateProperty.all<Color>(
                    Colors.white.withOpacity(0.1)),
                tabs: [
                  Tab(
                    child: Text(
                      "On Theater",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Pre Order",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Coming Soon",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(
            children: [
              onTheater(),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
