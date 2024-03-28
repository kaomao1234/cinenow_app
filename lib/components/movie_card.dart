import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieCard extends StatefulWidget {
  String imageSrc, title;
  void Function() onTap;
  MovieCard(
      {required this.title,
      required this.imageSrc,
      required this.onTap,
      super.key});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  Transform(
                    transform: Matrix4.translationValues(0, 10, 0),
                    child: Transform.scale(
                      scale: 1.5,
                      child: Image.asset(
                        widget.imageSrc,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Center(
                          child: Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      )),
                    ),
                  )
                ],
              ),
            ),
            Positioned.fill(
                child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap:widget.onTap,
              ),
            ))
          ],
        ));
  }
}
