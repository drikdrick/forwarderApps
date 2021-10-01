import 'package:flutter/material.dart';

import 'stylesheet.dart';

Widget cardOnGoingOrder(orderId, driverName, containerId, addressPort, namePort,
    addressWarehouse, nameWarehouse) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
    child: Card(
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
                      orderId,
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
                          "Ongoing",
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
              containerId,
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
                      children: [
                        Text(
                          addressPort,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          namePort,
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
            ),
            Divider(
              thickness: 1,
              color: biruUtama,
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
                      children: [
                        Text(
                          addressWarehouse,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          nameWarehouse,
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
            ),
          ],
        ),
      ),
    ),
  );
}

Widget cardPendingOrder(orderId, driverName, containerId, addressPort, namePort,
    addressWarehouse, nameWarehouse) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
    child: Card(
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
                      orderId,
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
                          "Pending",
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
              containerId ?? "Uknnown",
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
                        color: biruUtama,
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
                          addressPort,
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
                              namePort,
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
                          addressWarehouse,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          nameWarehouse,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6D6C6B),
                          ),
                          overflow: TextOverflow.ellipsis,
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
    ),
  );
}

Widget cardDoneOrder(orderId, driverName, containerId, addressPort, namePort,
    addressWarehouse, nameWarehouse) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
    child: Card(
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
                      orderId,
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
                    ),
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
              containerId,
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
                    backgroundColor: biruUtama,
                    radius: 9,
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
                          addressPort,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          namePort,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6D6C6B),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
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
                    backgroundColor: biruUtama,
                    radius: 9,
                    child: Icon(
                      Icons.done,
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
                          addressWarehouse,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          nameWarehouse,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6D6C6B),
                          ),
                          overflow: TextOverflow.ellipsis,
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
    ),
  );
}
