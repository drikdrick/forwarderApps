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
                      tglTempo.toString(),
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
//Paid