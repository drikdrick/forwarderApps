import '../Services/Authenticationi.dart';
import 'package:flutter/material.dart';

Widget throwError(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 2,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Terdapat aktivitas di perangkat lain.\nSilahkan login kembali.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              reset(context);
            },
            child: Text("Logout"))
      ],
    ),
  );
}
