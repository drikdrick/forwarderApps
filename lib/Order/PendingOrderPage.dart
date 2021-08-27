import 'package:bokshaulforwarder/Model/Order.dart';
import 'package:bokshaulforwarder/Resource/stylesheet.dart';
import 'package:flutter/material.dart';

class PendingOrder extends StatelessWidget {
  final Order order;

  PendingOrder({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Order Detail",
          style: TextStyle(color: Colors.black),
        ),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  order.orderId,
                  style: TextStyle(
                      // color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      order.status,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: orange,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Shipping Line"),
                Text("Jadwal Pelayaran"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Shipping Line"),
                Text("Jadwal Pelayaran"),
              ],
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text("Nama Driver"),
            //     Text("PIC Trucker"),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text("No Telpon"),
            //     Text("PIC Trucker"),
            //   ],
            // ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Status Pengiriman",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: CircleAvatar(
                //     backgroundColor: Colors.grey,
                //     radius: 10,
                //     child: Icon(
                //       Icons.location_on_outlined,
                //       size: 15,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                Flexible(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tempat pengambilan lorem Ipsum dolor sinaaaa",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween, //tidak berfungsi
                          children: [
                            Text(
                              order.asal,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF6D6C6B),
                              ),
                            ),
                            Text(
                              "10:00 WIB",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF6D6C6B),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: CircleAvatar(
                //     backgroundColor: Colors.grey,
                //     radius: 10,
                //     child: Icon(
                //       Icons.close,
                //       size: 15,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                Flexible(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tempat pengambilan lorem Ipsum dolor sinaaaa",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween, //tidak berfungsi
                          children: [
                            Text(
                              order.tujuan,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF6D6C6B),
                              ),
                            ),
                            // Text(
                            //   "10:00 WIB",
                            //   style: TextStyle(
                            //     fontSize: 10,
                            //     fontWeight: FontWeight.w600,
                            //     color: Color(0xFF6D6C6B),
                            //   ),
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}