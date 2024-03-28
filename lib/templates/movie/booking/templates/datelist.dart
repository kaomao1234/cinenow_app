import 'package:cinenow_app/models/index.dart';
import 'package:flutter/material.dart';

class DateList extends StatefulWidget {
  List<Session> dateArr;
  DateList({required this.dateArr, super.key});

  @override
  State<DateList> createState() => _DateListState();
}

class _DateListState extends State<DateList> {
  final ScrollController _controller = ScrollController();
  int isSelected = 0;
  double itemExtended = 80;
  @override
  void initState() {
    // TODO: implement initState
    _controller.addListener(() {
      double currentOffset = _controller.offset;
      int calculatedIndex = (currentOffset / itemExtended).toInt();
      if (isSelected != calculatedIndex) {
        setState(() {
          isSelected = calculatedIndex;
        });
      }
    });
    super.initState();
  }

  Decoration unselectedDecoration() {
    return ShapeDecoration(
      color: Color(0xFF181818),
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Color(0xFF242424)),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  Decoration selectedDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)));
  }

  void onSelectedItemChange(int index) {
    _controller.animateTo(
      index * itemExtended, // adjust based on item size
      duration: Duration(milliseconds: 300), // adjust animation duration
      curve: Curves.ease,
    );
  }

  double getPadding(int index, int isSelected) {
    if (index == isSelected - 1 || index == isSelected + 1) {
      return 15;
    } else {
      return 45;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: RotatedBox(
            quarterTurns: -1,
            child: ListWheelScrollView(
                controller: _controller,
                itemExtent: itemExtended,
                diameterRatio: 15,
                children: List.generate(
                  widget.dateArr.length,
                  (index) => RotatedBox(
                    quarterTurns: 1,
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        padding: EdgeInsets.only(
                            top: index != isSelected
                                ? getPadding(index, isSelected)
                                : 0),
                        child: Column(
                          children: [
                            Container(
                              padding: index == isSelected
                                  ? EdgeInsets.all(8)
                                  : null,
                              decoration: index == isSelected
                                  ? selectedDecoration()
                                  : unselectedDecoration(),
                              child: GestureDetector(
                                onTap: () => onSelectedItemChange(index),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, bottom: 8, left: 4, right: 4),
                                  child: Text(
                                    // 'Mon\n11/02',
                                    widget.dateArr[index].date,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: index == isSelected
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 15, bottom: 15, left: 5, right: 5),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              child: Text(
                                // "20:00",
                                widget.dateArr[index].times[0],
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        )),
                  ),
                )),
          ),
        ));
  }
}
