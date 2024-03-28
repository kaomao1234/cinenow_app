import 'package:cinenow_app/components/ticket_info_tile.dart';
import 'package:cinenow_app/viewmodels/index.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  late TicketsViewModel _viewModel;
  @override
  void initState() {
    // TODO: implement initState
    _viewModel = TicketsViewModel();
    super.initState();
  }

  void onShoppingCart() {
    Navigator.of(context).pushNamed("/shopping_cart");
  }

  void popPage() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          style: IconButton.styleFrom(
              iconSize: 22,
              shape: const CircleBorder(
                  side: BorderSide(width: 1, color: Color(0xFF606060)))),
          icon: const Padding(
            padding: EdgeInsets.only(left: 0),
            child: Icon(
              Icons.arrow_back,
              color: Color(0xFF606060),
            ),
          ),
          onPressed: popPage,
        ),
        centerTitle: true,
        title: const Text(
          'Tickets',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 21,
            fontWeight: FontWeight.w500,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  foregroundColor: Colors.black),
              onPressed: onShoppingCart,
              child: Badge(
                label: Text(0.toString()),
                child: const Icon(
                  FluentIcons.cart_24_filled,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const Divider(),
          Expanded(
              child: ListView.builder(
            itemCount: _viewModel.ticketInfoData.length,
            itemExtent: 288,
            itemBuilder: (context, index) => Column(
              children: [
                Expanded(
                    child:
                        TicketInfoTile(data: _viewModel.ticketInfoData[index])),
                Divider()
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
