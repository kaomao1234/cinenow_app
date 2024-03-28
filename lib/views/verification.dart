import 'package:cinenow_app/utils/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late AdaptiveSize _adaptiveSize;
  final formKey = GlobalKey<FormState>();

  void onVerify() {}
  @override
  void initState() {
    _adaptiveSize = AdaptiveSize(context);
    super.initState();
  }

  void popPage() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            style: IconButton.styleFrom(iconSize: 22),
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            color: Colors.black,
            onPressed: popPage,
          ),
          backgroundColor: Colors.white,
          border: Border.all(color: Colors.transparent),
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              height: _adaptiveSize.getHeightPercent(92),
              child: Padding(
                padding: EdgeInsets.only(
                    left: _adaptiveSize.getWidthPercent(9),
                    right: _adaptiveSize.getWidthPercent(9),
                    top: _adaptiveSize.getHeightPercent(2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                        height: 150,
                        child: Image.asset("assets/images/reverse_logo.png")),
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
                              color: Color(0xFFFFC020),
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
                    Text(
                      'Verify Code',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Please check your email.\nWe just sent a verification code on your email',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF353535),
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: PinCodeTextField(
                            appContext: context,
                            length: 4,
                            pinTheme: PinTheme(
                                inactiveColor: Colors.black,
                                selectedColor: Colors.blue,
                                activeColor: Colors.blue),
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Didn’t get a code?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(),
                              foregroundColor: Colors.transparent,
                              padding: EdgeInsets.all(0)),
                          onPressed: () {},
                          child: Text(
                            'Try again',
                            style: TextStyle(
                              color: Color(0xFFFFC020),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: onVerify,
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(18),
                          backgroundColor: Color(0xFFFFC020),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                      child: Text(
                        'VERIFY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.28,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'By signing up you have agreed to our',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF858484),
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Terms of Use & Privacy Policy',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF090909),
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
