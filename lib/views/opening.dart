import 'package:cinenow_app/utils/index.dart';
import 'package:cinenow_app/views/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningState();
}

class _OpeningState extends State<OpeningPage> {
  late AdaptiveSize _adaptiveSize;
  @override
  void initState() {
    _adaptiveSize = AdaptiveSize(context);
    super.initState();
  }

  void toSignUp() {
    Navigator.pushNamed(context, "/create_account");
  }

  void toLogin() {
    Navigator.pushNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Color(0xFFFFC020),
        child: Padding(
          padding: EdgeInsets.only(
              left: _adaptiveSize.getWidthPercent(12),
              right: _adaptiveSize.getWidthPercent(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                  height: 150, child: Image.asset("assets/images/logo.png")),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Cine',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
                style: TextStyle(decoration: TextDecoration.none),
              ),
              SizedBox(
                height: 50,
              ),
              OutlinedButton(
                child: Text(
                  'SIGN UP WITH EMAIL',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.28,
                  ),
                ),
                onPressed: toSignUp,
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    side: BorderSide(color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4))),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: toLogin,
                child: Text(
                  'Already have an account?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
