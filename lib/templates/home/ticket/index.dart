import 'package:cinenow_app/components/index.dart';
import 'package:cinenow_app/viewmodels/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class TicketBody extends StatefulWidget {
  const TicketBody({super.key});

  @override
  State<TicketBody> createState() => _TicketBodyState();
}

class _TicketBodyState extends State<TicketBody> {
  TicketViewModel _viewModel = TicketViewModel();
  final CardSwiperController controller = CardSwiperController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void onTickets() {
    Navigator.of(context).pushNamed("/tickets");
  }

  void popPage() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 60, right: 60),
                child: Text(
                  'Once you buy a movie ticket simply scan the barcode to acces to your movie.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                  height: 400,
                  child: CardSwiper(
                      backCardOffset: const Offset(40, 10),
                      numberOfCardsDisplayed: 3,
                      cardBuilder: (context, index, horizontalOffsetPercentage,
                              verticalOffsetPercentage) =>
                          TicketCard(
                            data: _viewModel.ticketList[index],
                            height: 350,
                          ),
                      cardsCount: _viewModel.ticketList.length)),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.white),
                  onPressed: onTickets,
                  child: SizedBox(
                    height: 60,
                    child: Center(
                      child: Text(
                        'Tickets',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
