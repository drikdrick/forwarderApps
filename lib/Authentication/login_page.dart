import 'dart:convert';

import 'forgot_password_page.dart';
import '../Services/Authenticationi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;

import '../index.dart';
import '../Resource/stylesheet.dart';
import 'sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SharedPreferences? preferences;
  final _formKey = GlobalKey<FormState>();
  // late String email, password;
  bool _isLoading = false;
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  late ScaffoldMessengerState scaffoldMessenger;
  var errorMsg;

  bool isVisible = true;
  // Uri url = Uri.parse('https://apiflutter.forwarder.boksman.co.id/login');

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                width * 0.05, height * 0.1, width * 0.05, height * 0.1),
            child: Stack(
              children: [
                Form(
                  key: _formKey,
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
                              decorationColor: biruUtama.withOpacity(0.75),
                              decorationThickness: 5,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.2,
                          ),
                          errorMsg == null
                              ? Container()
                              : Center(
                                  child: Text(
                                    errorMsg,
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          SizedBox(
                            width: width * 0.9,
                            height: 75,
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                labelText: "Username",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: inputBorder),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: biruUtama),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                suffixIcon: Icon(Icons.perm_identity),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Username tidak boleh kosong.';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SizedBox(
                            width: width * 0.9,
                            height: 75,
                            child: TextFormField(
                              obscureText: isVisible,
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: "Password",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: inputBorder),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: biruUtama),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(15),
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password tidak boleh kosong.';
                                }
                                return null;
                              },
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
                                child: Text(
                                  "Log In",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    signIn();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: biruUtama,
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
                _isLoading
                    ? Positioned.fill(
                        child: loadingProcess(height, width),
                      )
                    : SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }

  //API
  signIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'username': _usernameController.text,
      'password': _passwordController.text
    };
    try {
      var jsonResponse;
      Uri url = Uri.parse('https://apiflutter.forwarder.boksman.co.id/login');
      var response = await http.post(url, body: data);
      if (response.statusCode == 201) {
        jsonResponse = json.decode(response.body);
        if (jsonResponse["success"]) {
          sharedPreferences.setBool('isLoggedIn', true);

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => Index(
                  index: 0,
                ),
              ),
              (route) => false);
          setState(() {
            _isLoading = false;
          });
          sharedPreferences.setString("token", jsonResponse['data']['token']);
          sharedPreferences.setInt("idUser", jsonResponse['data']['id']);
        }
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            content: Text("Username/Password salah. Coba lagi."),
          ),
        );
      }
    } catch (e) {
      reset(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          content: Text("Terjadi kesalahan. Silahkan login kembali."),
        ),
      );
    }
  }
}
