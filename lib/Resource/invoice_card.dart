import 'stylesheet.dart';
import 'package:flutter/material.dart';

//Unpaid
Widget cardUnpaid(invoiceId, tglTempo, perusahaan) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
    child: Card(
      shadowColor: biruUtama,
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
      shadowColor: biruUtama,
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
          ],
        ),
      ),
    ),
  );
}

//Card Invoice Detail
Widget invoiceDetail(String orderId, String asal, String tujuan,
    String container, String truck, String size, String amount) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      shadowColor: biruUtama,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              orderId,
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
                Text(
                  asal,
                  overflow: TextOverflow.visible,
                ),
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
                Text(tujuan),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Container #",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    )),
                Text(container),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Truck #",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    )),
                Text(truck),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Size",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    )),
                Text(size),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Amount (RP)",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    )),
                Text(amount),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
