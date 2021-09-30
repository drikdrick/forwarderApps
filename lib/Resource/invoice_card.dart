import 'package:flutter/material.dart';

//Unpaid
Widget cardUnpaid(invoiceId, tglTempo, perusahaan) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
    child: Card(
      shadowColor: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(perusahaan),
                    Text(
                      invoiceId,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.chevron_right),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jatuh tempo",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w600),
                    ),
                    // Text(
                    //   "Jumlah tagihan",
                    //   style: TextStyle(
                    //       color: abuProfile, fontWeight: FontWeight.w600),
                    // ),
                    // Text(
                    //   "No. Tagihan",
                    //   style: TextStyle(
                    //       color: abuProfile, fontWeight: FontWeight.w600),
                    // ),
                    // Text(
                    //   "No. Kontainer",
                    //   style: TextStyle(
                    //       color: abuProfile, fontWeight: FontWeight.w600),
                    // ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      tglTempo.toString().split(' ')[0],
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w600),
                    ),
                    // Text(
                    //   "Jumlah tagihan",
                    //   style: TextStyle(
                    //       color: abuProfile, fontWeight: FontWeight.w600),
                    // ),
                    // Text(
                    //   "No. Tagihan",
                    //   style: TextStyle(
                    //       color: abuProfile, fontWeight: FontWeight.w600),
                    // ),
                    // Text(
                    //   "No. Kontainer",
                    //   style: TextStyle(
                    //       color: abuProfile, fontWeight: FontWeight.w600),
                    // ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}

//Paid
Widget cardPaid(invoiceId, tglTempo, perusahaan) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
    child: Card(
      shadowColor: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(perusahaan),
                    Text(
                      invoiceId,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.chevron_right),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           "Jumlah tagihan",
            //           style: TextStyle(
            //               color: abuProfile, fontWeight: FontWeight.w600),
            //         ),
            //         Text(
            //           "No. Tagihan",
            //           style: TextStyle(
            //               color: abuProfile, fontWeight: FontWeight.w600),
            //         ),
            //         Text(
            //           "No. Kontainer",
            //           style: TextStyle(
            //               color: abuProfile, fontWeight: FontWeight.w600),
            //         ),
            //       ],
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       children: [
            //         Text(
            //           "Jumlah tagihan",
            //           style: TextStyle(
            //               color: abuProfile, fontWeight: FontWeight.w600),
            //         ),
            //         Text(
            //           "No. Tagihan",
            //           style: TextStyle(
            //               color: abuProfile, fontWeight: FontWeight.w600),
            //         ),
            //         Text(
            //           "No. Kontainer",
            //           style: TextStyle(
            //               color: abuProfile, fontWeight: FontWeight.w600),
            //         ),
            //       ],
            //     )
            //   ],
            // )
          ],
        ),
      ),
    ),
  );
}

//Card Invoice Detail
Widget invoiceDetail(String asal, String tujuan, String container, String truck, String size, String amount) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      shadowColor: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "GK-822101406010235",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Asal",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text("HITACHI CONSTRUCTION MACHINERY"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tujuan",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text("New Priok Container Terminal One"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Container #",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    )),
                Text("NYKU 4918652"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Truck #",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    )),
                Text("B9755UEH"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Size",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    )),
                Text("40'GP"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Amount (RP)",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    )),
                Text("1,650,000"),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
