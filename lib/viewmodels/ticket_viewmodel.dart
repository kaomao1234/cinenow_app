import 'package:cinenow_app/models/index.dart';

class TicketViewModel {
  List<TicketData> ticketList = [
    TicketData(
        name: "Star wars",
        seat: "A1",
        session: "12:00",
        code: "A",
        imageUrl: "assets/images/star_wars_logo_new_tall.png"),
    TicketData(
        name: "The batman",
        seat: "A2",
        session: "12:00",
        code: "A",
        imageUrl: "assets/images/the_batman_banner.png"),
    TicketData(
        name: "Interstellar",
        seat: "A3",
        session: "12:00",
        code: "A",
        imageUrl: "assets/images/interstellar.jpg"),
  ];
}
