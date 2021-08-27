import 'package:bokshaulforwarder/Authentication/EmailVerificationPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../Resource/stylesheet.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
              width * 0.1, height * 0.1, width * 0.1, height * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue.withOpacity(0.75),
                  decorationThickness: 5,
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nama Perusahaan",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: inputBorder),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Contoh nama perusahaan : Boksman Asia_PT",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ),
              // IntlPhoneField(
              //   decoration: InputDecoration(
              //     labelText: 'Phone Number',
              //     border: OutlineInputBorder(
              //       borderSide: BorderSide(),
              //     ),
              //   ),
              //   initialCountryCode: 'IN',
              //   onChanged: (phone) {
              //     print(phone.completeNumber);
              //   },
              // ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "No. Hanphone",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: inputBorder),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Username",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: inputBorder),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              TextFormField(
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
              TextFormField(
                obscureText: isVisible,
                decoration: InputDecoration(
                  labelText: "Kata Sandi",
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
                        ? Icons.visibility_off
                        : Icons.remove_red_eye),
                  ),
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
                        child: Text("Sign Up"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmailVerification(),
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
                        text: 'Sudah punya akun? ',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Log In',
                            style: TextStyle(
                              color: Color(0xFF7FB800),
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                              },
                          ),
                          TextSpan(text: ' disini.'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
