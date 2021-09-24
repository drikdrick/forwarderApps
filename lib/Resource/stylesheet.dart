import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//Color Paletter
Color biruUtama = const Color(0xFF0891D5);
Color btnPrimary = const Color(0xFF008DD4);
Color merah = const Color(0xFFD71031);
Color hijau = const Color(0xFF7FB800);
Color success = const Color(0xFF7AC64F);
Color orange = const Color(0xFFF08401);
Color biruMuda = const Color(0xFFE5F7FF);
Color inputBorder = const Color(0xFFE7ECEF);
Color selesai = const Color(0xFFE1E1E0);
Color abuProfile = const Color(0xFF767675);

//Icon
CircleAvatar status = CircleAvatar(
  radius: 11,
  backgroundColor: Colors.grey,
  child: CircleAvatar(
    radius: 10,
    backgroundColor: Colors.white,
    child: Icon(
      Icons.lens,
      size: 15,
      color: Colors.grey,
    ),
  ),
);

CircleAvatar statusNow = CircleAvatar(
  radius: 11,
  child: CircleAvatar(
    radius: 10,
    backgroundColor: Colors.white,
    child: Icon(
      Icons.lens,
      size: 15,
    ),
  ),
);

CircleAvatar statusDone = CircleAvatar(
  radius: 10,
  child: Icon(
    Icons.done,
    size: 15,
  ),
);

Widget loadingProcess(height, width) {
  return Container(
    height: height * 0.25,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.blue,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        )),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitFoldingCube(color: biruUtama),
        SizedBox(
          height: 25,
        ),
        Text(
          "Mohon Tunggu..",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        )
      ],
    ),
  );
}

Alert showSucces(BuildContext context) {
  return Alert(
    context: context,
    type: AlertType.success,
    title: "Berhasil!",
    desc: "Profil telah diperbaharui.",
    buttons: [
      DialogButton(
        child: Text(
          "COOL",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      )
    ],
  );
}
