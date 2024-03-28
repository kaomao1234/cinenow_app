import 'package:cinenow_app/utils/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AdaptiveSize _adaptiveSize;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _adaptiveSize = AdaptiveSize(context);
    super.initState();
  }

  void onLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
    }
    Navigator.pushNamed(context, "/home");
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
          body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 20),
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
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Now',
                          style: TextStyle(
                            color: Color(0xFFFFC020),
                            fontSize: 32,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
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
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
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
                            borderRadius: BorderRadius.all(Radius.circular(6)),
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
                            borderRadius: BorderRadius.all(Radius.circular(6)),
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
                            borderRadius: BorderRadius.all(Radius.circular(6)),
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
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide(
                              color: Color(0xFFC2C2C2),
                            ))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: onLogin,
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(18),
                        backgroundColor: Color(0xFFFFC020),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    child: Text(
                      'LOGIN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: 0.28,
                      ),
                    ),
                  ),
                  Expanded(
                      child: SizedBox(
                    height: 20,
                  ))
                ],
              ),
            ),
          ),
        ));
  }
}
