import 'package:bokshaulforwarder/Model/promo.dart';
import 'package:flutter/material.dart';

import '../Notification/promo_detail_page.dart';

Widget promoCard(BuildContext context, Promo promo) {
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
                child: Image.network(promo.icon),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  promo.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              promo.content,
              maxLines: 2,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.75),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Image.network(
            promo.banner,
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
              promo.createdAt.toString().split(' ')[0],
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
}
