import 'dart:developer';

class SeatStatus {
  bool _available;
  bool _reserved;
  bool _selected;

  SeatStatus(this._available, this._reserved, this._selected);

  void switchAvailable() {
    _available = !_available;
    _reserved = false; // Set reserved to false when switching available
    _selected = false; // Set selected to false when switching available
  }

  void switchReserved() {
    _reserved = !_reserved;
    _available = false; // Set available to false when switching reserved
    _selected = false; // Set selected to false when switching reserved
  }

  void switchSelected() {
    // Only set available to true if the seat is not already reserved
    _selected = !_selected;
    _available = !_selected && !_reserved;
  }

  bool get available => _available;
  bool get reserved => _reserved;
  bool get selected => _selected;
}
