import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Color biruUtama = const Color(0xFF0891D5);
Color btnPrimary = const Color(0xFF008DD4);
Color merah = const Color(0xFFD71031);
Color hijau = const Color(0xFF7FB800);
Color success = const Color(0xFF7AC64F);
Color orange = const Color(0xFFF08401);
Color biruMuda = const Color(0xFFE5F7FF);
Color inputBorder = const Color(0xFFE7ECEF);
Color selesai = const Color(0xFFE1E1E0);
Color abuProfile = const Color(0xFF767675);

Widget loadingProcess(height, width) {
  return Container(
    height: height * 0.25,
    // width: width * 0.75,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.blue,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        )),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitFoldingCube(color: biruUtama),
        SizedBox(
          height: 25,
        ),
        Text(
          "Mohon Tunggu..",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        )
      ],
    ),
  );
}

Widget orderBerlangsung(noOrder, driverName, noContainer, alamatOrigin,
    daerahOrigin, alamatDestination, daerahDestination, pickUpTime, lastTime) {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        alamatOrigin,
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
                            daerahOrigin,
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
          Divider(
            thickness: 1,
            color: Colors.blue,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        alamatDestination,
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
                            daerahDestination,
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
