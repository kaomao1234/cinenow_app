import 'dart:developer';

import 'package:cinenow_app/models/index.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SeatsTable extends StatefulWidget {
  final void Function(int, int) onSelectSeat;
  final List<List<SeatStatus>> tableStatus;
  const SeatsTable(
      {required this.tableStatus, required this.onSelectSeat, super.key});

  @override
  State<SeatsTable> createState() => _SeatsTableState();
}

class _SeatsTableState extends State<SeatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: List.generate(
            9,
            (indexRow) => TableRow(
                    children: List.generate(7, (indexCol) {
                  bool isLabelSeatRow = indexRow > 7;
                  bool isNumberSeatCell = indexCol == 0;
                  if (isLabelSeatRow) {
                    String labelSeats = String.fromCharCode(65 + indexCol - 1);
                    return TableCell(
                        child: indexCol != 0
                            ? Text(
                                labelSeats,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            : Container());
                  } else {
                    if (isNumberSeatCell) {
                      return TableCell(
                        child: Text(
                          (indexRow + 1).toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500),
                        ),
                      );
                    } else {
                      SeatStatus seatsStatus =
                          widget.tableStatus[indexRow][indexCol - 1];
                      return TableCell(
                        child: IconButton(
                          onPressed: () =>
                              widget.onSelectSeat(indexRow, indexCol - 1),
                          style: IconButton.styleFrom(
                              padding: const EdgeInsets.all(0)),
                          icon: Icon(CommunityMaterialIcons.sofa_single,
                              size: 40,
                              color: seatsStatus.available
                                  ? const Color(0xFFD9D9D9)
                                  : seatsStatus.selected
                                      ? Colors.orange
                                      : Colors.black),
                        ),
                      );
                    }
                  }
                }))),
      ),
    );
  }
}
