import 'package:cinenow_app/components/index.dart';
import 'package:cinenow_app/enum/index.dart';
import 'package:cinenow_app/utils/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  PaymentCards selectedCard = PaymentCards.visa;
  late AdaptiveSize _adaptiveSize;
  @override
  void initState() {
    _adaptiveSize = AdaptiveSize(context);
    super.initState();
  }

  void popPage() {
    Navigator.of(context).pop();
  }

  void onSelected(PaymentCards? val) {
    setState(() {
      selectedCard = val!;
    });
  }

  void onAddNewCard() {}
  void onConfirm() {
    Navigator.pushNamed(context, "/payment");
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Check Out',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 21,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          style: IconButton.styleFrom(
              iconSize: 22,
              shape: const CircleBorder(
                  side: BorderSide(width: 1, color: Color(0xFF5F5F5F)))),
          icon: const Padding(
            padding: EdgeInsets.only(left: 0),
            child: Icon(
              Icons.arrow_back,
              color: Color(0xFF5F5F5F),
            ),
          ),
          color: Colors.black,
          onPressed: popPage,
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              PaymentCard(
                cardNumber: "1234 **** **** 6789",
                value: PaymentCards.mastercard,
                groupValue: selectedCard,
                onSelect: onSelected,
              ),
              PaymentCard(
                cardNumber: "1234 **** **** 6789",
                value: PaymentCards.visa,
                groupValue: selectedCard,
                onSelect: onSelected,
              )
            ],
          )),
          TextButton(
              onPressed: onAddNewCard,
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFF5F5F5),
                  foregroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  '+ Add new card',
                  style: TextStyle(
                    color: Color(0xFF5E5E5E),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )),
          const SizedBox(
            height: 47,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '\$ 38.00',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC020),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: onConfirm,
                  child: SizedBox(
                    width: _adaptiveSize.getWidthPercent(100),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Confirm',
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
        ],
      ),
    ));
  }
}
