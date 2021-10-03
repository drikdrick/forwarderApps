import 'dart:convert';
import 'dart:ui';

import 'package:bokshaulforwarder/Authentication/login_page.dart';
import 'package:bokshaulforwarder/Resource/stylesheet.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bokshaulforwarder/Services/config.dart';

class ResetPassword extends StatefulWidget {
  final int userId;
  const ResetPassword({Key? key, required this.userId}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isVisible = true;
  bool isVisible2 = true;
  // bool isVisible3 = true;
  bool isLoading = false;
  TextEditingController newPassword = TextEditingController();
  TextEditingController retypePassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Reset Password",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                        decorationColor: biruUtama.withOpacity(0.75),
                        decorationThickness: 5,
                      ),
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    TextFormField(
                      controller: newPassword,
                      obscureText: isVisible,
                      decoration: InputDecoration(
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
                        labelText: "Password Baru",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: inputBorder,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: biruUtama),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password baru tidak boleh kosong.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: retypePassword,
                      obscureText: isVisible2,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible2 == true
                                  ? isVisible2 = false
                                  : isVisible2 = true;
                            });
                          },
                          icon: Icon(isVisible2
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined),
                        ),
                        labelText: "Ulangi Password Baru",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: inputBorder,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: biruUtama),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ulangi password tidak boleh kosong.';
                        } else if (value != newPassword.text) {
                          return 'Kedua password tidak sama.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Center(
                      child: SizedBox(
                        // height: height * 0.05,
                        width: width * 0.5,
                        child: ElevatedButton(
                          child: Text(
                            "SIMPAN",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                // isLoading = true;
                              });
                              updatePassword();
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
                    ),
                  ],
                ),
              ),
            ),
            isLoading
                ? Center(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: loadingProcess(
                        height,
                        width,
                      ),
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

  void updatePassword() async {
    var data = {
      "id_user": widget.userId.toString(),
      "password": newPassword.text,
      "repassword": retypePassword.text
    };

    Uri url = Uri.parse(baseUrl + "/resetpassword");
    var response = await http.post(url, body: data);
    // print(response.body);
    var jsonResponse = jsonDecode(response.body);
    // print(jsonResponse);

    if (jsonResponse["success"]) {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: biruUtama,
          behavior: SnackBarBehavior.floating,
          content: Text("Reset password berhasil. Silahkan login."),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          content: Text("Terdapat kesalahan. Silahkan ulangi."),
        ),
      );
    }
  }
}
