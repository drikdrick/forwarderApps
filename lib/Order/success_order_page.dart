// import 'package:bokshaulforwarder/Model/Order.dart';
// import 'package:bokshaulforwarder/Model/OrderDetailJson.dart';
import 'package:bokshaulforwarder/Model/order_json.dart';
import 'package:bokshaulforwarder/Resource/stylesheet.dart';
import 'package:flutter/material.dart';

class SuccessOrder extends StatelessWidget {
  final Freshorder freshOrder;

  SuccessOrder({required this.freshOrder});

  @override
  Widget build(BuildContext context) {
    var status = freshOrder.statusOrder;
    print(status);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Order Selesai",
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
      body: Padding(
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
                      freshOrder.gkOrder,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          "Selesai",
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
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shipping Line",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(freshOrder.slName),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Jadwal Pelayaran",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(freshOrder.etd.toString()),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Status Pengiriman",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
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
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween, //tidak berfungsi
                          children: [
                            Text(
                              freshOrder.namaPort,
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
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: CircleAvatar(
            //         radius: 10,
            //         child: Icon(
            //           Icons.done,
            //           size: 15,
            //         ),
            //       ),
            //     ),
            //     Flexible(
            //       child: Container(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text(
            //               'Tempat pengambilan lorem Ipsum dolor sinaaaa',
            //               style: TextStyle(
            //                 fontSize: 12,
            //                 fontWeight: FontWeight.w600,
            //               ),
            //               overflow: TextOverflow.ellipsis,
            //             ),
            //             Text(
            //               freshOrder.namaGudang,
            //               style: TextStyle(
            //                 fontSize: 10,
            //                 fontWeight: FontWeight.w600,
            //                 color: Color(0xFF6D6C6B),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            Expanded(
              child: ListView(
                children: [
                  if (freshOrder.statusOrder == 1 ||
                      freshOrder.statusOrder == 4) ...[
                    milestone("Pekerjaan Diterima", "10:00 WIB"), //-4
                    milestone("Menuju Pelabuhan", "10:00 WIB"), //-3
                    milestone("Tiba di Pelabuhan", "10:00 WIB"), //-2
                    milestone("Muat di Pelabuhan", "10:00 WIB"), //-1
                    milestone("Menunggu keluar Pelabuhan", "10:00 WIB"), //0
                    milestone("Menuju Gudang Consignee", "10:00 WIB"), //1
                    milestone("Tiba di Gudang Consignee", "10:00 WIB"), //2
                    milestone("Bongkar Muat", "10:00 WIB"), //3
                  ],

                  milestone("Menuju Depo", "10:00 WIB"), //4
                  milestone("Tiba di Depo", "10:00 WIB"), //5
                  milestone("Cek Container", "10:00 WIB"), //6
                  milestone("Keluar Depo", "10:00 WIB"), //7
                  if (freshOrder.statusOrder == 2 ||
                      freshOrder.statusOrder == 3) ...[
                    milestone("Menuju Gudang Shipper", "10:00 WIB"), //8
                    milestone("Tiba di Gudang Shipper", "10:00 WIB"), //9
                    milestone("Muat Barang", "10:00 WIB"), //10
                    milestone("Menuju Pelabuhan", "10:00 WIB"), //11
                    milestone("Tiba di Pelabuhan", "10:00 WIB"), //12
                  ],

                  milestone("Selesai", "10:00 WIB"), //13
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget milestone(title, time) {
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
                  title,
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
                      freshOrder.namaPort,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6D6C6B),
                      ),
                    ),
                    Text(
                      time,
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
