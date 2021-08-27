import 'package:bokshaulforwarder/Resource/stylesheet.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              width * 0.1, height * 0.1, width * 0.1, height * 0.1),
          child: Column(
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
                        decorationColor: Colors.blue.withOpacity(0.75),
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
                          text: "user@gmail.com",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        TextSpan(
                            text: ". Masukkan kode untuk verifikasi email."),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  PinCodeTextField(
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
                      inactiveColor: Colors.blue.withOpacity(0.2),
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    // errorAnimationController: errorController,
                    // controller: textEditingController,
                    onCompleted: (v) {
                      print("Completed");
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
                            style: TextStyle(color: Colors.black, fontSize: 11),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Cek kotak masuk bagian spam atau ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 11),
                              children: [
                                TextSpan(
                                  text: "kirim ulang ",
                                  style: TextStyle(color: hijau),
                                ),
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
              Center(
                child: SizedBox(
                  height: height * 0.075,
                  width: width * 0.55,
                  child: ElevatedButton(
                    child: Text("Verifikasi Email"),
                    onPressed: () {
                      Navigator.pop(context);
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
      ),
    );
  }
}
