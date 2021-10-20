// import 'package:bokshaulforwarder/Model/Order.dart';
// import 'package:bokshaulforwarder/Model/OrderDetailJson.dart';
import 'package:bokshaulforwarder/Model/order_detail_json.dart';
import 'package:bokshaulforwarder/Resource/stylesheet.dart';
import 'package:flutter/material.dart';

class SuccessOrder extends StatelessWidget {
  final OrderDetail currentOrder;

  SuccessOrder({required this.currentOrder});

  @override
  Widget build(BuildContext context) {
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
              children: [
                Text(
                  currentOrder.gkOrder,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
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
                Expanded(
                  child: Text(
                    currentOrder.slName,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   "Jadwal Pelayaran",
                //   style: TextStyle(
                //     fontWeight: FontWeight.w600,
                //     color: Colors.black,
                //   ),
                // ),
                // Text(currentOrder.eTD.toString()),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Status Pengiriman",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
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
            //               currentOrder.namaGudang,
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
                  if (currentOrder.statusOrder == "1" ||
                      currentOrder.statusOrder == "4" ||
                      currentOrder.statusOrder == "inbound") ...[
                    milestone("Pekerjaan Diterima", ""), //-4
                    milestone("Menuju Pelabuhan", ""), //-3
                    milestone("Tiba di Pelabuhan", ""), //-2
                    milestone("Muat di Pelabuhan", ""), //-1
                    milestone("Menunggu keluar Pelabuhan", ""), //0
                    milestone("Menuju Gudang Consignee", ""), //1
                    milestone("Tiba di Gudang Consignee", ""), //2
                    milestone("Bongkar Muat", ""), //3
                  ],

                  milestone("Menuju Depo", ""), //4
                  milestone("Tiba di Depo", ""), //5
                  milestone("Cek Container", ""), //6
                  milestone("Keluar Depo", ""), //7
                  if (currentOrder.statusOrder == "2" ||
                      currentOrder.statusOrder == "3" ||
                      currentOrder.statusOrder == "outbound") ...[
                    milestone("Menuju Gudang Shipper", ""), //8
                    milestone("Tiba di Gudang Shipper", ""), //9
                    milestone("Muat Barang", ""), //10
                    milestone("Menuju Pelabuhan", ""), //11
                    milestone("Tiba di Pelabuhan", ""), //12
                  ],

                  milestone("Selesai", ""), //13
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget milestone(String title, String time) {
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
                      title,
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
