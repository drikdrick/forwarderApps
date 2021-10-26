import 'stylesheet.dart';
import 'package:flutter/material.dart';

Widget cardStatusOrder() {
  return Card(
    // semanticContainer: false,
    shadowColor: biruUtama,
    elevation: 5,
    child: ListTile(
      leading: CircleAvatar(
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
      ),
      title: Text(
        "Menuju Depo",
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        "Asal",
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Color(0xFF6D6C6B),
        ),
      ),
      dense: true,
      // enabled: false,
    ),
  );
}
