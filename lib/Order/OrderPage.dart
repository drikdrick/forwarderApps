import 'package:bokshaulforwarder/Order/CanceledOrderPage.dart';
import 'package:bokshaulforwarder/Order/ChatPage.dart';
import 'package:bokshaulforwarder/Order/OngoingOrderPage.dart';
import 'package:bokshaulforwarder/Order/PendingOrderPage.dart';
import 'package:bokshaulforwarder/Resource/stylesheet.dart';
import 'package:bokshaulforwarder/Order/SuccessOrderPage.dart';
import 'package:flutter/material.dart';
import '../Model/Order.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int selectedIndex = 0;
  var orderResult = [];
  @override
  @override
  initState() {
    orderResult = orderList;
    super.initState();
  }

  void filterOder(String keyword) {
    orderResult = orderList
        .where(
          (order) => order.status.toLowerCase().contains(keyword.toLowerCase()),
        )
        .toList();
  }

  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Chat();
                }),
              );
            },
            icon: Icon(Icons.chat_outlined),
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: status.length,
              itemBuilder: (context, index) => InkWell(
                child: buildStatus(index),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: orderResult.length,
              itemBuilder: (context, index) {
                final Order order = orderResult[index];
                return InkWell(
                  child: buildCard(
                      order.orderId,
                      order.status,
                      order.namaDriver,
                      order.noContainer,
                      order.asal,
                      order.tujuan,
                      selectedIndex),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        if (selectedIndex == 0) {
                          return PendingOrder(order: order);
                        } else if (selectedIndex == 1) {
                          return OngoingOrder(order: order);
                        } else if (selectedIndex == 2) {
                          return SuccessOrder(order: order);
                        } else {
                          return CanceledOrderDetail(
                            order: order,
                          );
                        }
                      }),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStatus(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          filterOder(status[index]);
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 5,
                color: selectedIndex == index ? biruUtama : Colors.transparent,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              status[index],
              style: TextStyle(
                fontWeight:
                    selectedIndex == index ? FontWeight.w600 : FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(
      noOrder, status, driverName, noContainer, origin, destination, current) {
    if (current == 0) {
      //Card Pending
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        noOrder,
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
                            status,
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
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  ),
                ],
              ),
              Text(
                driverName,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                noContainer,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 9,
                        child: Icon(
                          Icons.location_on_outlined,
                          size: 15,
                          color: Colors.blue,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, //tidak berfungsi
                            children: [
                              Text(
                                origin,
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 9,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, //tidak berfungsi
                            children: [
                              Text(
                                destination,
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
            ],
          ),
        ),
      );
    } else if (current == 1) {
      //Card Selesai
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        noOrder,
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
                            status,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: hijau,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  ),
                ],
              ),
              Text(
                driverName,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                noContainer,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 10,
                      child: Icon(
                        Icons.location_on_outlined,
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
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, //tidak berfungsi
                            children: [
                              Text(
                                origin,
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
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 10,
                      child: Icon(
                        Icons.lens_outlined,
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
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, //tidak berfungsi
                            children: [
                              Text(
                                destination,
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
            ],
          ),
        ),
      );
    } else if (current == 2) {
      //Card Selesai
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        noOrder,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            status,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: selesai,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  ),
                ],
              ),
              Text(
                driverName,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                noContainer,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 10,
                      child: Icon(
                        Icons.location_on_outlined,
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
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, //tidak berfungsi
                            children: [
                              Text(
                                origin,
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
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, //tidak berfungsi
                            children: [
                              Text(
                                destination,
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
            ],
          ),
        ),
      );
    }
    //Card dibatalkan
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      noOrder,
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
                          status,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: merah,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                ),
              ],
            ),
            Text(
              driverName,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              noContainer,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 10,
                    child: Icon(
                      Icons.location_on_outlined,
                      size: 15,
                      color: Colors.white,
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
                              origin,
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 10,
                    child: Icon(
                      Icons.close,
                      size: 15,
                      color: Colors.white,
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
                              destination,
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
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  
}
