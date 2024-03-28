import 'package:cinenow_app/models/index.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TicketInfoTile extends StatefulWidget {
  TicketInfoData data;
  TicketInfoTile({required this.data, super.key});

  @override
  State<TicketInfoTile> createState() => _TicketInfoTileState();
}

class _TicketInfoTileState extends State<TicketInfoTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 20, top: 20, bottom: 20),
          child: Container(
            width: 150,
            height: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              widget.data.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.all(0),
                leading: Icon(
                  Icons.calendar_month_sharp,
                  color: Colors.black,
                ),
                title: Text(
                  '${widget.data.date} - ${widget.data.session}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.all(0),
                leading: Icon(
                  FluentIcons.ticket_diagonal_28_filled,
                  color: Colors.black,
                ),
                title: Text(
                  'Seat ${widget.data.seat}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.all(0),
                leading: Icon(
                  FluentIcons.cart_24_filled,
                  color: Colors.black,
                ),
                title: Text(
                  '\$ ${widget.data.price}',
                  textAlign: TextAlign.left,
                  semanticsLabel: "dollars",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: SizedBox(
                    width: 100,
                    child: Text(
                      'View',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
