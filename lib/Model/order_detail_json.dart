import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class OrderDetail {
  String? gkOrder;
  String? eTD;
  String? namaDriver;
  String? noPolisi;
  String? companyName;
  String? noContainer;
  int? statusOrder;
  int? statusDriver;
  String? timeSelesai;
  String? timeMenujuPelabuhan;
  String? timeTibaDipelabuhan;
  String? timeMuatDipelabuhan;
  String? timeMenungguKeluarPelabuhan;
  String? timeMenujuGudangConsignee;
  String? timeTibaGudangConsignee;
  String? timeBongkarMuat;
  String? timeMenujuDepo;
  String? timeTibaDepo;
  String? timeCekContainer;
  String? timeKeluarDepo;
  String? timeMenujuGudangShipper;
  String? timeTibaGudangShipper;
  String? timeMuatBarang;
  String? timeMenujuPelabuhanEx;
  String? timeTibaDipelabuhanEx;
  String? slName;
  String? vesselName;
  String? voyageNumber;
  String? namaPort;
  String? addressPort;
  String? namaGudang;
  String? addressGudang;

  OrderDetail(
      {required this.gkOrder,
      required this.eTD,
      required this.namaDriver,
      required this.noPolisi,
      required this.companyName,
      required this.noContainer,
      required this.statusOrder,
      required this.statusDriver,
      required this.timeSelesai,
      required this.timeMenujuPelabuhan,
      required this.timeTibaDipelabuhan,
      required this.timeMuatDipelabuhan,
      required this.timeMenungguKeluarPelabuhan,
      required this.timeMenujuGudangConsignee,
      required this.timeTibaGudangConsignee,
      required this.timeBongkarMuat,
      required this.timeMenujuDepo,
      required this.timeTibaDepo,
      required this.timeCekContainer,
      required this.timeKeluarDepo,
      required this.timeMenujuGudangShipper,
      required this.timeTibaGudangShipper,
      required this.timeMuatBarang,
      required this.timeMenujuPelabuhanEx,
      required this.timeTibaDipelabuhanEx,
      required this.slName,
      required this.vesselName,
      required this.voyageNumber,
      required this.namaPort,
      required this.addressPort,
      required this.namaGudang,
      required this.addressGudang});

  factory OrderDetail.createOrder(Map<String, dynamic> json) => OrderDetail(
        gkOrder: json['gk_order'],
        eTD: json['ETD'],
        namaDriver: json['nama_driver'],
        noPolisi: json['no_polisi'],
        companyName: json['company_name'],
        noContainer: json['no_container'],
        statusOrder: json['status_order'],
        statusDriver: json['status_driver'],
        timeSelesai: json['time_selesai'],
        timeMenujuPelabuhan: json['time_menuju_pelabuhan'],
        timeTibaDipelabuhan: json['time_tiba_dipelabuhan'],
        timeMuatDipelabuhan: json['time_muat_dipelabuhan'],
        timeMenungguKeluarPelabuhan: json['time_menunggu_keluar_pelabuhan'],
        timeMenujuGudangConsignee: json['time_menuju_gudang_consignee'],
        timeTibaGudangConsignee: json['time_tiba_gudang_consignee'],
        timeBongkarMuat: json['time_bongkar_muat'],
        timeMenujuDepo: json['time_menuju_depo'],
        timeTibaDepo: json['time_tiba_depo'],
        timeCekContainer: json['time_cek_container'],
        timeKeluarDepo: json['time_keluar_depo'],
        timeMenujuGudangShipper: json['time_menuju_gudang_shipper'],
        timeTibaGudangShipper: json['time_tiba_gudang_shipper'],
        timeMuatBarang: json['time_muat_barang'],
        timeMenujuPelabuhanEx: json['time_menuju_pelabuhan_ex'],
        timeTibaDipelabuhanEx: json['time_tiba_dipelabuhan_ex'],
        slName: json['sl_name'],
        vesselName: json['vessel_name'],
        voyageNumber: json['voyage_number'],
        namaPort: json['nama_port'],
        addressPort: json['address_port'],
        namaGudang: json['nama_gudang'],
        addressGudang: json['address_gudang'],
      );
}

Future<OrderDetail> getOrderDetail(orderId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')!; //fetch Token

  Uri url = Uri.parse(
      "https://apiflutter.forwarder.boksman.co.id/orderselesai/detail/" +
          orderId);

  var response = await http.get(url, headers: {'token': token});
  var jsonResult = json.decode(response.body);
  // print(jsonResult);
  // var orderData = (jsonResult as Map<String, dynamic>);
  // return OrderDetail.createOrder(orderData);
  print(jsonResult['data']);

  return OrderDetail.createOrder(jsonResult['data'][0]);
}
