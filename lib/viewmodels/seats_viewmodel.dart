import 'dart:developer';

import 'package:cinenow_app/models/index.dart';

class SeatsViewModel {
  String movieName = "Inglourious Basterds";
  String date = "Mon 22/11";
  String session = "19:00";
  List<List<SeatStatus>> _tableStatus = List.generate(8,
      (index) => List.generate(6, (index) => SeatStatus(true, false, false)));
  void Function(void Function()) stateView;
  SeatsViewModel(this.stateView);
  List<List<SeatStatus>> get tableStatus => _tableStatus;
  void onSelectSeat(int row, int col) {
    stateView(() {
      log("$row$col");
      SeatStatus seatStatus = _tableStatus[row][col];
      // log(seatStatus.reserved.toString());
      if (!seatStatus.reserved) {
        seatStatus.switchSelected();
      }
    });
  }
}
