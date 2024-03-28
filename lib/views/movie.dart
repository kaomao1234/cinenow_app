import 'package:cinenow_app/models/index.dart';
import 'package:cinenow_app/templates/movie/index.dart';
import 'package:cinenow_app/viewmodels/index.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  MovieViewModel _viewModel = MovieViewModel();
  late final List<Widget> _list;
  int selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    _list = [
      BookingMovieBody(movieBookingData: _viewModel.bookingData),
      DetailMovieBody(movieDetailsData: _viewModel.detailsData)
    ];
    super.initState();
  }

  void onShoppingCart() {
    Navigator.pushNamed(context, "/shopping_cart");
  }

  void popPage() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: DefaultTabController(
      initialIndex: selectedIndex,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  style: IconButton.styleFrom(
                      iconSize: 22,
                      shape: const CircleBorder(
                          side: BorderSide(width: 1, color: Colors.white))),
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.black,
                  onPressed: popPage,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TabBar(
                        onTap: (int val) {
                          setState(() {
                            selectedIndex = val;
                          });
                        },
                        indicatorColor: Colors.amber,
                        dividerColor: Colors.transparent,
                        labelPadding: const EdgeInsets.all(0),
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.white.withOpacity(0.1)),
                        tabs: const [
                          Tab(
                            child: Text(
                              "Booking",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Details",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        foregroundColor: Colors.black),
                    onPressed: onShoppingCart,
                    child: Badge(
                      label: Text(0.toString()),
                      child: Icon(
                        FluentIcons.cart_24_filled,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: _list.elementAt(selectedIndex),
        ),
      ),
    ));
  }
}
