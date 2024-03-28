import 'package:cinenow_app/models/index.dart';

class ShoppingCartViewModel {
  void Function(void Function()) stateView;
  final List<TicketInfoData> _list = [
    TicketInfoData("assets/images/the_batman_banner.png", "Nov 22, 2024", "6pm",
        "9A", "19.00"),
    TicketInfoData(
        "assets/images/interstellar.jpg", "Nov 22, 2024", "6pm", "9A", "19.00")
  ];
  ShoppingCartViewModel(this.stateView);

  void onRemove() {
    stateView(() {});
  }

  List<TicketInfoData> get ticketInfoData => _list;
}
