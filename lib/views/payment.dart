import 'package:cinenow_app/utils/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:u_credit_card/u_credit_card.dart';

class PaymentCardModel {
  String name, number, cvv, expireDate;
  PaymentCardModel(
      {required this.cvv,
      required this.expireDate,
      required this.name,
      required this.number});
}

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late AdaptiveSize _adaptiveSize;
  PaymentCardModel selectedCard = PaymentCardModel(
      cvv: "123",
      expireDate: "08/29",
      name: "Alan Wake",
      number: "xxxx-xxxx-xxxx-2024");
  @override
  void initState() {
    _adaptiveSize = AdaptiveSize(context);
    // TODO: implement initState
    super.initState();
  }

  void onConfirm() {
    Navigator.of(context).pushReplacementNamed("/processing");
  }

  void popPage() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Payment',
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CreditCardUi(
              topLeftColor: Color(0xFF151B3A),
              cardHolderFullName: selectedCard.name,
              cardNumber: selectedCard.number,
              validThru: selectedCard.expireDate,
              cardProviderLogo:
                  SvgPicture.asset("assets/icons/master_card.svg"),
              creditCardType: CreditCardType.mastercard,
              cardProviderLogoPosition: CardProviderLogoPosition.left,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: selectedCard.number,
                      textAlign: TextAlign.center,
                      readOnly: true,
                      style: const TextStyle(
                        color: Color(0xFF424242),
                        fontSize: 17,
                        height: 2,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF696969))),
                        contentPadding: EdgeInsets.only(bottom: 0),
                        labelText: "Card number",
                        labelStyle: TextStyle(
                          color: Color(0xFF696969),
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue: selectedCard.name,
                      readOnly: true,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Color(0xFF424242),
                        fontSize: 17,
                        height: 2,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        isDense: true,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF696969))),
                        contentPadding: EdgeInsets.only(bottom: 0),
                        labelText: "Card Name",
                        labelStyle: TextStyle(
                          color: Color(0xFF696969),
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            initialValue: selectedCard.expireDate,
                            readOnly: true,
                            style: const TextStyle(
                              color: Color(0xFF424242),
                              fontSize: 17,
                              height: 2,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF696969))),
                              contentPadding: EdgeInsets.only(bottom: 0),
                              labelText: "Expire Date",
                              labelStyle: TextStyle(
                                color: Color(0xFF696969),
                                fontSize: 22,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            initialValue: selectedCard.cvv,
                            readOnly: true,
                            style: const TextStyle(
                              color: Color(0xFF424242),
                              fontSize: 17,
                              height: 2,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF696969))),
                              contentPadding: EdgeInsets.only(bottom: 0),
                              labelText: "CVV",
                              labelStyle: TextStyle(
                                color: Color(0xFF696969),
                                fontSize: 17,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 24,
              ),
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
    ));
  }
}
