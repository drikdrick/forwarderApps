import 'package:bokshaulforwarder/Model/Promo.dart';
import 'package:bokshaulforwarder/PromoDetailPage.dart';
import 'package:flutter/material.dart';

class Promotion extends StatefulWidget {
  const Promotion({Key? key}) : super(key: key);

  @override
  _PromotionState createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: promoList.length,
      itemBuilder: (context, index) {
        final Promo promo = promoList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return DetailPromo(
                  promo: promo,
                );
              }),
            );
          },
          child: Card(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      child: Image.asset('images/Boksman_Logogram.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      promo.headline,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  promo.description,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.75),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Image.asset(
                  promo.img,
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    promo.time,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
