import 'package:bokshaulforwarder/Authentication/ForgotPasswordPage.dart';
import 'package:flutter/material.dart';
import '../Resource/stylesheet.dart';
import './SignUpPage.dart';
import 'package:flutter/gestures.dart';

import '../Index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              width * 0.05, height * 0.1, width * 0.05, height * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue.withOpacity(0.75),
                      decorationThickness: 5,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.2,
                  ),
                  SizedBox(
                    width: width * 0.9,
                    height: 75,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Username",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: inputBorder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        suffixIcon: Icon(Icons.perm_identity),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.9,
                    height: 75,
                    child: TextFormField(
                      obscureText: isVisible,
                      decoration: InputDecoration(
                        labelText: "Password",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: inputBorder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible == true
                                  ? isVisible = false
                                  : isVisible = true;
                            });
                          },
                          icon: Icon(isVisible
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Text(
                    "Lupa Password?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7FB800),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPassword(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.075,
                      width: width * 0.55,
                      child: ElevatedButton(
                        child: Text("Log In"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Index(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Belum punya akun? ',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              color: Color(0xFF7FB800),
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ),
                                );
                              },
                          ),
                          TextSpan(text: ' disini.'),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
