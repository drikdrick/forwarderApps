import 'dart:math';

import '../Model/order_detail_json.dart';
import 'package:flutter/material.dart';

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
  late String avatar;

  @override
  void initState() {
    avatar = Random().nextInt(15).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OrderDetail order = widget.currentOrder;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          order.gkOrder,
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
              child: Map(
                order: order,
              ),
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
                      Column(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: biruUtama,
                                radius: width * 0.07,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: width * 0.065,
                                  backgroundImage: AssetImage(
                                      "images/avatar/" + avatar + ".png"),
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
                                        order.noContainer.toString(),
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
                                            "Berlangsung",
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
                                        order.namaDriver,
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
                                        order.noPolisi,
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
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: Icon(
                          //     Icons.chat_outlined,
                          //     color: Colors.black,
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      currentStatus(order),
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
                          // Text(
                          //   "Jadwal Pelayaran",
                          //   style: TextStyle(
                          //     fontSize: 10,
                          //     fontWeight: FontWeight.w600,
                          //     color: Color(0xFF6D6C6B),
                          //   ),
                          // ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            order.slName,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6D6C6B),
                            ),
                          ),
                          // Text(
                          //   order.,
                          //   style: TextStyle(
                          //     fontSize: 10,
                          //     fontWeight: FontWeight.w400,
                          //     color: Color(0xFF6D6C6B),
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Asal dan Tujuan
                      Text(
                        order.origin,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF6D6C6B),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        order.destination,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF6D6C6B),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Divider(
                        color: biruUtama,
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
                      ...getOrderStatus(order),
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

  Widget buildStatusOrder(CircleAvatar icon, String msg, String time) {
    return Row(
      children: [
        Padding(padding: const EdgeInsets.all(10.0), child: icon),
        Flexible(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  msg,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  time.toString(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6D6C6B),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget nextStatusOrder(CircleAvatar icon, String msg) {
    return Row(
      children: [
        Padding(padding: const EdgeInsets.all(10.0), child: icon),
        Text(
          msg,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  List<Widget> getOrderStatus(OrderDetail order) {
    List<Widget> currentStatus = [];
    if (order.statusOrder == "1" ||
        order.statusOrder == "4" ||
        order.statusOrder == "inbound") {
      for (var i = -4; i <= 13; i++) {
        if (i >= 8 && i < 13) {
          continue;
        } else if (i < order.statusDriver) {
          currentStatus.add(
            buildStatusOrder(statusDone, orderMessage[i + 4], ""),
          );
        } else if (i > order.statusDriver) {
          currentStatus.add(
            nextStatusOrder(status, orderMessage[i + 4]),
          );
        } else if (i == order.statusDriver) {
          currentStatus.add(
            nextStatusOrder(statusNow, orderMessage[i + 4]),
          );
        }
      }
    } else if (order.statusOrder == "2" ||
        order.statusOrder == "3" ||
        order.statusOrder == "outbound") {
      for (var i = 4; i <= 13; i++) {
        if (i < order.statusDriver) {
          currentStatus.add(
            buildStatusOrder(statusDone, orderMessage[i + 4], ""),
          );
        } else if (i > order.statusDriver) {
          currentStatus.add(
            nextStatusOrder(status, orderMessage[i + 4]),
          );
        } else if (i == order.statusDriver) {
          currentStatus.add(
            nextStatusOrder(statusNow, orderMessage[i + 4]),
          );
        }
      }
    }
    return currentStatus;
  }

  Widget currentStatus(OrderDetail order) {
    return Container(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    orderMessage[order.statusDriver + 4],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
