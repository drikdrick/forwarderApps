import 'package:bokshaulforwarder/Model/promo.dart';
import 'package:flutter/material.dart';

class DetailPromo extends StatelessWidget {
  final Promo promo;

  DetailPromo({required this.promo});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          Icon(
            Icons.share_outlined,
            color: Colors.black,
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'images/profitGanda.jpeg',
            height: height * 0.3,
            width: width,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  promo.headline,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  promo.time,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.withOpacity(0.8)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  promo.description,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
