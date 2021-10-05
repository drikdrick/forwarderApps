import 'dart:convert';

import 'package:bokshaulforwarder/Authentication/login_page.dart';
import 'package:bokshaulforwarder/Resource/stylesheet.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:http/http.dart' as http;

class EmailVerification extends StatefulWidget {
  final String username, email;
  const EmailVerification({required this.username, required this.email});

  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              width * 0.1, height * 0.1, width * 0.1, height * 0.1),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Verifikasi Email",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            decorationColor: biruUtama.withOpacity(0.75),
                            decorationThickness: 5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Kami telah mengirimkan kode verifikasi ke ",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: widget.email,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                                text:
                                    ". Masukkan kode untuk verifikasi email."),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      PinCodeTextField(
                        keyboardType: TextInputType.number,
                        appContext: context,
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.scale,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                          inactiveColor: biruUtama.withOpacity(0.2),
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        // errorAnimationController: errorController,
                        // controller: textEditingController,
                        onCompleted: (v) {
                          _isLoading = true;
                          verifOTP(v);
                        },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            // currentText = value;
                          });
                        },
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Tidak mendatpakan email?",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Cek kotak masuk bagian spam atau ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 11),
                                  children: [
                                    TextSpan(
                                        text: "kirim ulang ",
                                        style: TextStyle(color: success),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            setState(() {
                                              _isLoading = true;
                                            });
                                            resendOTP(
                                                widget.username, widget.email);
                                          }),
                                    TextSpan(text: "kode. "),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  // Center(
                  //   child: SizedBox(
                  //     height: height * 0.075,
                  //     width: width * 0.55,
                  //     child: ElevatedButton(
                  //       child: Text("Verifikasi Email"),
                  //       onPressed: () {
                  //         Navigator.pop(context);
                  //       },
                  //       style: ElevatedButton.styleFrom(
                  //         primary: biruUtama,
                  //         textStyle: TextStyle(
                  //           fontWeight: FontWeight.w400,
                  //           color: Colors.white,
                  //           fontSize: 18,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
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
    );
  }

  Future<void> verifOTP(otp) async {
    Uri url =
        Uri.parse('https://apiflutter.forwarder.boksman.co.id/verifikasi/otp/lupapassword');
    var response = await http.post(url, body: {'otp': otp});

    if (response.statusCode == 201) {
      var jsonResponse = json.decode(response.body);
      setState(() {
        _isLoading = false;
      });
      if (jsonResponse["success"]) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Registrasi berhasil. Silahkan login."),
            behavior: SnackBarBehavior.floating,
            backgroundColor: biruUtama,
          ),
        );
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Verifikasi gagal. Coba lagi."),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> resendOTP(username, email) async {
    Map data = {
      'username': username,
      'email': email,
    };
    var jsonResponse;

    Uri url =
        Uri.parse('https://apiflutter.forwarder.boksman.co.id/resend/otp');
    var response = await http.post(url, body: data);
    if (response.statusCode == 201) {
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: biruUtama,
          content: Text(jsonResponse["message"]),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Pengiriman OTP gagal. Coba lagi."),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
