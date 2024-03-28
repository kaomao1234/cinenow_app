import 'package:barcode_widget/barcode_widget.dart';
import 'package:cinenow_app/models/index.dart';
import 'package:cinenow_app/utils/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;
import 'dart:io';
import 'package:ticket_clippers/ticket_clippers.dart';
import 'package:barcode/barcode.dart';

import 'dart:math' as math;

class TicketCard extends StatefulWidget {
  final TicketData data;
  final double height;
  TicketCard({required this.data, required this.height, super.key});

  @override
  State<TicketCard> createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  final dm = Barcode.dataMatrix();
  late String svg;
  late AdaptiveSize _adaptiveSize;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _adaptiveSize = AdaptiveSize(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ClipPath(
        clipper: TicketRoundedEdgeClipper(
            position: 300, radius: 80, edge: Edge.horizontal),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                widget.data.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
                child: Padding(
              padding: EdgeInsets.only(top: widget.height / 2),
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.data.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Seat: ${widget.data.seat}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Session: ${widget.data.session}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: BarcodeWidget(
                          data: widget.data.code, barcode: Barcode.code39()),
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
