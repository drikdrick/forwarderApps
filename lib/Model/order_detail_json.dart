import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class OrderDetail {
  OrderDetail({
    required this.gkOrder,
    required this.namaDriver,
    required this.noPolisi,
    required this.companyName,
    required this.noContainer,
    required this.statusOrder,
    required this.statusDriver,
    required this.slName,
    required this.origin,
    required this.destination,
    required this.originCoordinate,
    required this.destinationCoordinate,
  });

  String gkOrder;
  String namaDriver;
  String noPolisi;
  String companyName;
  String noContainer;
  String statusOrder;
  int statusDriver;
  String slName;
  String origin;
  String destination;
  String originCoordinate;
  String destinationCoordinate;

  factory OrderDetail.createOrder(Map<String, dynamic> json) => OrderDetail(
        gkOrder: json["gk_order"],
        namaDriver: json["nama_driver"],
        noPolisi: json["no_polisi"],
        companyName: json["company_name"],
        noContainer: json["no_container"],
        statusOrder: json["status_order"].toString(),
        statusDriver: json["status_driver"],
        slName: json["sl_name"],
        origin: json["origin"],
        destination: json["destination"],
        originCoordinate: json["origin_coordinate"],
        destinationCoordinate: json["destination_coordinate"],
      );

  Map<String, dynamic> toJson() => {
        "gk_order": gkOrder,
        "nama_driver": namaDriver,
        "no_polisi": noPolisi,
        "company_name": companyName,
        "no_container": noContainer,
        "status_order": statusOrder,
        "status_driver": statusDriver,
        "sl_name": slName,
        "origin": origin,
        "destination": destination,
        "origin_coordinate": originCoordinate,
        "destination_coordinate": destinationCoordinate,
      };
}

Future<OrderDetail> getOrderDetail(orderId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')!; //fetch Token

  Uri url = Uri.parse(
      "https://apiflutter.forwarder.boksman.co.id/order/detail/" + orderId);

  var response = await http.get(url, headers: {'token': token});
  var jsonResult = json.decode(response.body);
  if (jsonResult["success"]) {
    return OrderDetail.createOrder(jsonResult['data'][0]);
  } else {
    throw Exception(jsonResult["message"]);
  }
}

Future<OrderDetail> getOrderDone(orderId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')!; //fetch Token

  Uri url = Uri.parse(
      "https://apiflutter.forwarder.boksman.co.id/order/detail/" + orderId);

  var response = await http.get(url, headers: {'token': token});
  var jsonResult = json.decode(response.body);

  if (jsonResult["success"]) {
    return OrderDetail.createOrder(jsonResult['data'][0]);
  } else {
    throw Exception(jsonResult["message"]);
  }
}

List orderMessage = [
  "Pekerjaan diterima.",
  "Menuju pelabuhan.",
  "Tiba di pelabuhan.",
  "Muat di pelabuhan.",
  "Menunggu keluar pelabuhan.",
  "Menuju gudang consignee.",
  "Tiba di gudang consignee.",
  "Bongkar muat.",
  "Menuju depo.",
  "Tiba di depo.",
  "Cek kontainer.",
  "Keluar depo",
  "Menuju gudang shipper",
  "Tiba digudang shipper",
  "Muat barang",
  "Menuju pelabuhan",
  "Tiba di pelabuhan.",
  "Selesai",
];
