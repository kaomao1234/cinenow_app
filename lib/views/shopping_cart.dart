import 'package:cinenow_app/components/index.dart';
import 'package:cinenow_app/viewmodels/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  late ShoppingCartViewModel _viewModel;
  @override
  void initState() {
    _viewModel = ShoppingCartViewModel(setState);
    super.initState();
  }

  void popPage() {
    Navigator.of(context).pop();
  }

  void onCheckOut() {
    Navigator.pushNamed(context, "/cards");
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'Shopping cart',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          ),
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
            color: Colors.black,
            onPressed: popPage,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Divider(),
            Expanded(
                child: ListView.builder(
              itemExtent: 288,
              itemBuilder: (context, index) => Column(
                children: [
                  Expanded(
                      child: TicketInfoShop(
                          data: _viewModel.ticketInfoData[index])),
                  Divider()
                ],
              ),
              itemCount: _viewModel.ticketInfoData.length,
            )),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sub total:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '\$ 38.00',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: onCheckOut,
                    child: const SizedBox(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Continue',
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
