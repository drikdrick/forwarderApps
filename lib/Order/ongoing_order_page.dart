import 'dart:convert';

import 'package:bokshaulforwarder/Model/order_detail_json.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Resource/stylesheet.dart';
import 'map_app.dart';

class OngoingOrder extends StatefulWidget {
  const OngoingOrder({Key? key, required this.currentOrder}) : super(key: key);
  final OrderDetail currentOrder;
  // final String orderid;
  @override
  _OngoingOrderState createState() => _OngoingOrderState();
}

class _OngoingOrderState extends State<OngoingOrder> {
  bool isLoading = false;
  late OrderDetail currentOrder;

  // @override
  // void initState() {
  //   _getFreshData();
  //   super.initState();
  // }

  // Future<void> _getFreshData() async {
  //   getOrderData(context);
  // }

  // void getOrderData(BuildContext context) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String token = pref.getString('token')!;

  //   Uri url = Uri.parse(
  //       'https://apiflutter.forwarder.boksman.co.id/orderberlangsung/detail/' +
  //           widget.orderid);
  //   var jsonResponse = await http.get(url, headers: {'token': token});
  //   setState(() {
  //     var convertResult = jsonDecode(jsonResponse.body);
  //     currentOrder = convertResult;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          currentOrder.gkOrder!,
          style: TextStyle(color: Colors.black),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 1,
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            Center(
              child: Map(),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.25,
              minChildSize: 0.25,
              maxChildSize: 0.9,
              builder: (context, controller) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: ListView(
                    controller: controller,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Container(
                              height: 1,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 1,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: width * 0.07,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: width * 0.065,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "order.orderId",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Text(
                                            "order.status",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: success,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "order.namaDriver",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        " | ",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "082274867174",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.chat_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 10,
                                child: Icon(
                                  Icons.location_on_outlined,
                                  size: 15,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Tempat pengambilan lorem Ipsum dolor sinaaaaaaaaaaa",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween, //tidak berfungsi
                                      children: [
                                        Text(
                                          "Asal",
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
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shipping Line",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6D6C6B),
                            ),
                          ),
                          Text(
                            "Jadwal Pelayaran",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6D6C6B),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shipping Line",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6D6C6B),
                            ),
                          ),
                          Text(
                            "Jadwal Pelayaran",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6D6C6B),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Tempat Asal (Origin)",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF6D6C6B),
                        ),
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pellentesque volutpat lorem quis auctor.",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6D6C6B),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Tempat Tujuan (Destinasi)",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF6D6C6B),
                        ),
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pellentesque volutpat lorem quis auctor.",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6D6C6B),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Divider(
                        color: Color(0xFFC4C4C3),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Status Pengiriman",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      buildStatusOrderDone(),
                      buildStatusOrderDone(),
                      buildStatusOrderNow(),
                      buildStatusOrder(),
                      buildStatusOrder(),
                      buildStatusOrder(),
                      buildStatusOrder(),
                      buildStatusOrder(),
                      buildStatusOrder(),
                      buildStatusOrder(),
                      buildStatusOrder(),
                      buildStatusOrder(),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatusOrder() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
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
        ),
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
                Text(
                  "destination",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6D6C6B),
                  ),
                ),
                // Row(
                //   mainAxisAlignment:
                //       MainAxisAlignment.spaceBetween, //tidak berfungsi
                //   children: [
                //     Text(
                //       "destination",
                //       style: TextStyle(
                //         fontSize: 10,
                //         fontWeight: FontWeight.w600,
                //         color: Color(0xFF6D6C6B),
                //       ),
                //     ),
                //     Text(
                //       "10:00 WIB",
                //       style: TextStyle(
                //         fontSize: 10,
                //         fontWeight: FontWeight.w600,
                //         color: Color(0xFF6D6C6B),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildStatusOrderNow() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            radius: 11,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.lens,
                size: 15,
              ),
            ),
          ),
        ),
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
                Text(
                  "destination",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6D6C6B),
                  ),
                ),
                // Row(
                //   mainAxisAlignment:
                //       MainAxisAlignment.spaceBetween, //tidak berfungsi
                //   children: [
                //     Text(
                //       "destination",
                //       style: TextStyle(
                //         fontSize: 10,
                //         fontWeight: FontWeight.w600,
                //         color: Color(0xFF6D6C6B),
                //       ),
                //     ),
                //     Text(
                //       "10:00 WIB",
                //       style: TextStyle(
                //         fontSize: 10,
                //         fontWeight: FontWeight.w600,
                //         color: Color(0xFF6D6C6B),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildStatusOrderDone() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            radius: 10,
            child: Icon(
              Icons.done,
              size: 15,
            ),
          ),
        ),
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
                      "destination",
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
    );
  }
}
