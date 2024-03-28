import 'dart:developer';

import 'package:cinenow_app/enum/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentCard extends StatefulWidget {
  void Function(PaymentCards?) onSelect;
  PaymentCards value, groupValue;
  String cardNumber;
  PaymentCard(
      {required this.cardNumber,
      required this.groupValue,
      required this.value,
      required this.onSelect,
      super.key});

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  late bool isSelect;
  Map<String, String> icons = {
    PaymentCards.visa.toString(): "assets/icons/visa_card.svg",
    PaymentCards.mastercard.toString(): "assets/icons/master_card.svg"
  };
  @override
  void initState() {
    // TODO: implement initState
    isSelect = widget.groupValue == widget.value;
    super.initState();
  }

  void onSelectWrapper(PaymentCards? value) {
    widget.onSelect(value);
  }

  @override
  Widget build(BuildContext context) {
    isSelect = widget.groupValue == widget.value;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListTile(
        minVerticalPadding: 20,
        leading: SizedBox(
            width: 50,
            child: SvgPicture.asset(icons[widget.value.toString()]!)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        tileColor: Color(0xFFF5F5F5),
        selectedTileColor: Color(0xFF151B3A),
        selected: isSelect,
        title: Text(
          widget.value == PaymentCards.mastercard
              ? 'Credit Card'
              : widget.value == PaymentCards.visa
                  ? 'Debit Card'
                  : "",
          style: TextStyle(
            color: isSelect ? Colors.white : Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          widget.cardNumber,
          style: TextStyle(
            color: isSelect ? Color(0xFFBBBBBB) : Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: Radio<PaymentCards>(
          value: widget.value,
          groupValue: widget.groupValue,
          onChanged: onSelectWrapper,
          fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.white;
            }
            return Color(0xFF9A9A9A);
          }),
        ),
      ),
    );
  }
}
