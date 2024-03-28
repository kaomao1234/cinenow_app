import 'package:cinenow_app/utils/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  late AdaptiveSize _adaptiveSize;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    _adaptiveSize = AdaptiveSize(context);
    super.initState();
  }

  void popPage() {
    Navigator.of(context).pop();
  }

  void toVerification() {
    Navigator.of(context).pushNamed("/verification");
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
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Container(
              height: _adaptiveSize.getHeightPercent(92),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: _adaptiveSize.getWidthPercent(12),
                      right: _adaptiveSize.getWidthPercent(12),
                      top: _adaptiveSize.getHeightPercent(2)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
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
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                )),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Color(0xFFC2C2C2),
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Color(0xFFC2C2C2),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w300,
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                borderSide: BorderSide(
                                  color: Color(0xFFC2C2C2),
                                ))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                )),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xFFC2C2C2),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Color(0xFFC2C2C2),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w300,
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                borderSide: BorderSide(
                                  color: Color(0xFFC2C2C2),
                                ))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                          }
                          toVerification();
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(18),
                            backgroundColor: Color(0xFFFFC020),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4))),
                        child: Text(
                          'CREATE ACCOUNT',
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
          ),
        ));
  }
}
