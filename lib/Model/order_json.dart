import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    required this.gkOrder,
    required this.etd,
    required this.noContainer,
    required this.statusOrder,
    required this.slName,
    required this.vesselName,
    required this.voyageNumber,
    required this.name,
    required this.noPolisi,
    required this.namaPort,
    required this.addressPort,
    required this.namaGudang,
    required this.addressGudang,
  });

  String gkOrder;
  String etd;
  String noContainer;
  String statusOrder;
  String slName;
  String vesselName;
  String voyageNumber;
  String name;
  String noPolisi;
  String namaPort;
  String addressPort;
  String namaGudang;
  String addressGudang;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        gkOrder: json["gk_order"] ?? "Uknown",
        etd: json["ETD"] ?? "Uknown",
        noContainer: json["no_container"] ?? "Uknown",
        statusOrder: json["status_order"].toString(),
        slName: json["sl_name"] ?? "Uknown",
        vesselName: json["vessel_name"] ?? "Uknown",
        voyageNumber: json["voyage_number"] ?? "Uknown",
        name: json["name"] ?? "Uknown",
        noPolisi: json["no_polisi"] ?? "Uknown",
        namaPort: json["nama_port"] ?? "Uknown",
        addressPort: json["address_port"] ?? "Uknown",
        namaGudang: json["nama_gudang"] ?? "Uknown",
        addressGudang: json["address_gudang"] ?? "Uknown",
      );

  Map<String, dynamic> toJson() => {
        "gk_order": gkOrder,
        "ETD": etd,
        "no_container": noContainer,
        "status_order": statusOrder,
        "sl_name": slName,
        "vessel_name": vesselName,
        "voyage_number": voyageNumber,
        "name": name,
        "no_polisi": noPolisi,
        "nama_port": namaPort,
        "address_port": addressPort,
        "nama_gudang": namaGudang,
        "address_gudang": addressGudang,
      };
}

Future<List<Order>> fetchOrderBerlangsung() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')!; //fetch Token
  int userId = prefs.getInt('idUser')!; //fetch User ID

  Uri url = Uri.parse(
      "https://apiflutter.forwarder.boksman.co.id/orderberlangsung/$userId");

  var response = await http.get(url, headers: {'token': token});
  var jsonResult = jsonDecode(response.body);
  if (jsonResult["success"]) {
    return (jsonResult["data"] as List).map((e) => Order.fromJson(e)).toList();
  } else {
    throw Exception(jsonResult["message"]);
  }
}

Future<List<Order>> fetchOrderBerlangsungLimit() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')!; //fetch Token
  int userId = prefs.getInt('idUser')!; //fetch User ID

  Uri url = Uri.parse(
      "https://apiflutter.forwarder.boksman.co.id/orderberlangsung/limit/$userId");

  var response = await http.get(url, headers: {'token': token});
  var jsonResult = jsonDecode(response.body);
  if (jsonResult["success"]) {
    return (jsonResult["data"] as List).map((e) => Order.fromJson(e)).toList();
  } else {
    throw Exception(jsonResult["message"]);
  }
}

Future<List<Order>> fetchOrderPending() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')!; //fetch Token
  int userId = prefs.getInt('idUser')!; //fetch User ID

  Uri url = Uri.parse(
      "https://apiflutter.forwarder.boksman.co.id/ordermenunggu/$userId");

  var response = await http.get(url, headers: {'token': token});
  var jsonResult = jsonDecode(response.body);
  if (jsonResult["success"]) {
    return (jsonResult["data"] as List).map((e) => Order.fromJson(e)).toList();
  } else {
    throw Exception(jsonResult["message"]);
  }

  // return freshOrders;
}

Future<List<Order>> fetchOrderDone() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')!; //fetch Token
  int userId = prefs.getInt('idUser')!; //fetch User ID

  Uri url = Uri.parse(
      "https://apiflutter.forwarder.boksman.co.id/orderselesai/$userId");

  var response = await http.get(url, headers: {'token': token});
  var jsonResult = jsonDecode(response.body);
  if (jsonResult["success"]) {
    return (jsonResult["data"] as List).map((e) => Order.fromJson(e)).toList();
  } else {
    throw Exception(jsonResult["message"]);
  }
}
