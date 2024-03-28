import 'dart:developer';

import 'package:cinenow_app/models/index.dart';
import 'package:cinenow_app/templates/movie/booking/templates/index.dart';
import 'package:cinenow_app/utils/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class BookingMovieBody extends StatefulWidget {
  MovieBookingData movieBookingData;
  BookingMovieBody({required this.movieBookingData, super.key});

  @override
  State<BookingMovieBody> createState() => _BookingMovieBodyState();
}

class _BookingMovieBodyState extends State<BookingMovieBody> {
  late AdaptiveSize _adaptiveSize;
  @override
  void initState() {
    // TODO: implement initState
    _adaptiveSize = AdaptiveSize(context);
    super.initState();
  }

  void onReadMore() {}
  void onReserve() {
    Navigator.pushNamed(context, "/seats");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
          widget.movieBookingData.imageUrl,
          fit: BoxFit.cover,
        )),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(1)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.movieBookingData.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: SizedBox(
                              height: 100,
                              child: Text(
                                widget.movieBookingData.storyLine,
                                style: TextStyle(
                                  overflow: TextOverflow.clip,
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.white),
                              onPressed: onReadMore,
                              child: Text(
                                'Read more',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Sessions this week',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DateList(
                    dateArr: widget.movieBookingData.sessions,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFC020),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: onReserve,
                    child: SizedBox(
                      width: _adaptiveSize.getWidthPercent(100),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Reserve',
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
        )
      ],
    );
  }
}
