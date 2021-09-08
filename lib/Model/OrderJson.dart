// To parse this JSON data, do
//
//     final orderBerlangsung = orderBerlangsungFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

OrderBerlangsung orderBerlangsungFromJson(String str) =>
    OrderBerlangsung.fromJson(json.decode(str));

String orderBerlangsungToJson(OrderBerlangsung data) =>
    json.encode(data.toJson());

class OrderBerlangsung {
  OrderBerlangsung({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Data data;

  factory OrderBerlangsung.fromJson(Map<String, dynamic> json) =>
      OrderBerlangsung(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.freshorder,
    required this.trackTrace,
  });

  List<Freshorder> freshorder;
  List<dynamic> trackTrace;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        freshorder: List<Freshorder>.from(
            json["freshorder"].map((x) => Freshorder.fromJson(x))),
        trackTrace: List<dynamic>.from(json["track_trace"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "freshorder": List<dynamic>.from(freshorder.map((x) => x.toJson())),
        "track_trace": List<dynamic>.from(trackTrace.map((x) => x)),
      };
}

class Freshorder {
  Freshorder({
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
  DateTime etd;
  String? noContainer;
  int statusOrder;
  String slName;
  String vesselName;
  String voyageNumber;
  String name;
  String noPolisi;
  String namaPort;
  String addressPort;
  String namaGudang;
  String addressGudang;

  factory Freshorder.fromJson(Map<String, dynamic> json) => Freshorder(
        gkOrder: json["gk_order"] ?? null,
        etd: DateTime.parse(json["ETD"]),
        noContainer: json["no_container"],
        statusOrder: json["status_order"],
        slName: json["sl_name"],
        vesselName: json["vessel_name"],
        voyageNumber: json["voyage_number"],
        name: json["name"],
        noPolisi: json["no_polisi"],
        namaPort: json["nama_port"],
        addressPort: json["address_port"],
        namaGudang: json["nama_gudang"],
        addressGudang: json["address_gudang"],
      );

  Map<String, dynamic> toJson() => {
        "gk_order": gkOrder,
        "ETD": etd.toIso8601String(),
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

Future<List<Freshorder>> fetchOrderBerlangsung() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')!; //fetch Token
  int userId = prefs.getInt('idUser')!; //fetch User ID

  Uri url = Uri.parse(
      "https://apiflutter.forwarder.boksman.co.id/orderberlangsung/$userId");

  var response = await http.get(url, headers: {'token': token});
  var jsonResult;
  if (response.statusCode == 201) {
    jsonResult = jsonDecode(response.body);
  }
  return (jsonResult["data"]["freshorder"] as List)
      .map((e) => Freshorder.fromJson(e))
      .toList();

  // return freshOrders;
}

// class TrackTrace {
//   int id;
//   int statusDriver;
//   String gkNumber;
//   String forwarder;
//   String namaDriver;
//   String namaTrucker;
//   String noPolisi;
//   Null alamatFwd;
//   Null kotaFwd;
//   String namaSl;
//   Null provinsiFwd;
//   String shipper;
//   String alamatShp;
//   String kotaShp;
//   String provinsiShp;
//   String typeOrder;
//   int isDomestic;
//   String noContainer;
//   String origin;
//   String destination;
//   String latOrigin;
//   String longOrigin;
//   String latDestination;
//   String longDestination;

//   TrackTrace(
//       {required this.id,
//       required this.statusDriver,
//       required this.gkNumber,
//       required this.forwarder,
//       required this.namaDriver,
//       required this.namaTrucker,
//       required this.noPolisi,
//       required this.alamatFwd,
//       required this.kotaFwd,
//       required this.namaSl,
//       required this.provinsiFwd,
//       required this.shipper,
//       required this.alamatShp,
//       required this.kotaShp,
//       required this.provinsiShp,
//       required this.typeOrder,
//       required this.isDomestic,
//       required this.noContainer,
//       required this.origin,
//       required this.destination,
//       required this.latOrigin,
//       required this.longOrigin,
//       required this.latDestination,
//       required this.longDestination});

//   TrackTrace.fromJson(Map<String, dynamic> json) {
//     id : json['id'];
//     statusDriver = json['status_driver'];
//     gkNumber = json['gk_number'];
//     forwarder = json['forwarder'];
//     namaDriver = json['nama_driver'];
//     namaTrucker = json['nama_trucker'];
//     noPolisi = json['no_polisi'];
//     alamatFwd = json['alamat_fwd'];
//     kotaFwd = json['kota_fwd'];
//     namaSl = json['nama_sl'];
//     provinsiFwd = json['provinsi_fwd'];
//     shipper = json['shipper'];
//     alamatShp = json['alamat_shp'];
//     kotaShp = json['kota_shp'];
//     provinsiShp = json['provinsi_shp'];
//     typeOrder = json['type_order'];
//     isDomestic = json['is_domestic'];
//     noContainer = json['no_container'];
//     origin = json['origin'];
//     destination = json['destination'];
//     latOrigin = json['lat_origin'];
//     longOrigin = json['long_origin'];
//     latDestination = json['lat_destination'];
//     longDestination = json['long_destination'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['status_driver'] = this.statusDriver;
//     data['gk_number'] = this.gkNumber;
//     data['forwarder'] = this.forwarder;
//     data['nama_driver'] = this.namaDriver;
//     data['nama_trucker'] = this.namaTrucker;
//     data['no_polisi'] = this.noPolisi;
//     data['alamat_fwd'] = this.alamatFwd;
//     data['kota_fwd'] = this.kotaFwd;
//     data['nama_sl'] = this.namaSl;
//     data['provinsi_fwd'] = this.provinsiFwd;
//     data['shipper'] = this.shipper;
//     data['alamat_shp'] = this.alamatShp;
//     data['kota_shp'] = this.kotaShp;
//     data['provinsi_shp'] = this.provinsiShp;
//     data['type_order'] = this.typeOrder;
//     data['is_domestic'] = this.isDomestic;
//     data['no_container'] = this.noContainer;
//     data['origin'] = this.origin;
//     data['destination'] = this.destination;
//     data['lat_origin'] = this.latOrigin;
//     data['long_origin'] = this.longOrigin;
//     data['lat_destination'] = this.latDestination;
//     data['long_destination'] = this.longDestination;
//     return data;
//   }
// }
