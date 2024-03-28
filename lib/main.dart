import 'package:cinenow_app/views/confirmation.dart';
import 'package:cinenow_app/views/index.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MaterialApp(
      initialRoute: "/login",
      routes: {
        "/": (context) => const OpeningPage(),
        "/home": (context) => const HomePage(),
        "/create_account": (context) => const CreateAccountPage(),
        "/login": (context) => const LoginPage(),
        "/verification": (context) => const VerificationPage(),
        "/processing": (context) => const ProcessingPage(),
        "/cards": (context) => const CardsPage(),
        "/payment": (context) => const PaymentPage(),
        "/confirmation": (context) => const ConfirmationPage(),
        "/movie": (context) => const MoviePage(),
        "/seats": (context) => const SeatsPage(),
        "/shopping_cart": (context) => const ShoppingCartPage(),
        "/tickets": (context) => const TicketsPage()
      },
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
