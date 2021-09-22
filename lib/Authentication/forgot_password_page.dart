import 'dart:convert';
import 'dart:ui';

import 'package:bokshaulforwarder/Authentication/email_reset_password.dart';
import 'package:bokshaulforwarder/Authentication/email_verification_page.dart';
import 'package:flutter/material.dart';

import '../Resource/stylesheet.dart';
import 'package:http/http.dart' as http;
// import 'EmailVerificationPage.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              // padding: EdgeInsets.all(height*0.1),
              padding: EdgeInsets.fromLTRB(
                  width * 0.1, height * 0.1, width * 0.1, height * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lupa Kata Sandi",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue.withOpacity(0.75),
                            decorationThickness: 5,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        Text(
                          "Masukkan email yang terdaftar kami akan mengirimkan email untuk mengatur ulang kata sandi.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: inputBorder),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: height * 0.075,
                      width: width * 0.55,
                      child: ElevatedButton(
                        child: Text("Kirim Kode"),
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          sendOTP();
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
                  ),
                ],
              ),
            ),
            isLoading
                ? Center(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: loadingProcess(height, width),
                    ),
                  )
                : SizedBox(
                    height: 0,
                  ),
          ],
        ),
      ),
    );
  }

  void sendOTP() async {
    Uri url =
        Uri.parse("https://apiflutter.forwarder.boksman.co.id/lupapassword");

    var response = await http.post(url, body: {'email': emailController.text});
    var jsonObject = jsonDecode(response.body);
    print(jsonObject['success']);
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 201) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => EmailResetPassword(),
      //   ),
      // );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blue,
          content: Text("OTP berhasil dikirim, cek email anda."),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Email tidak ditermukan, coba lagi."),
        ),
      );
    }
  }
}
