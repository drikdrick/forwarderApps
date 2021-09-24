// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// OrderDetail orderDetailFromJson(String str) =>
//     OrderDetail.fromJson(json.decode(str));

// String orderDetailToJson(OrderDetail data) => json.encode(data.toJson());

// class OrderDetail {
//   OrderDetail({
//     required this.gkOrder,
//     required this.etd,
//     required this.namaDriver,
//     required this.noPolisi,
//     required this.companyName,
//     required this.noContainer,
//     required this.statusOrder,
//     required this.statusDriver,
//     required this.timeSelesai,
//     required this.timeMenujuPelabuhan,
//     required this.timeTibaDipelabuhan,
//     required this.timeMuatDipelabuhan,
//     required this.timeMenungguKeluarPelabuhan,
//     required this.timeMenujuGudangConsignee,
//     required this.timeTibaGudangConsignee,
//     required this.timeBongkarMuat,
//     required this.timeMenujuDepo,
//     required this.timeTibaDepo,
//     required this.timeCekContainer,
//     required this.timeKeluarDepo,
//     required this.timeMenujuGudangShipper,
//     required this.timeTibaGudangShipper,
//     required this.timeMuatBarang,
//     required this.timeMenujuPelabuhanEx,
//     required this.timeTibaDipelabuhanEx,
//     required this.slName,
//     required this.vesselName,
//     required this.voyageNumber,
//     required this.namaPort,
//     required this.addressPort,
//     required this.coordinatePort,
//     required this.namaGudang,
//     required this.coordinateGudang,
//     required this.addressGudang,
//   });

//   String gkOrder;
//   DateTime etd;
//   String namaDriver;
//   String noPolisi;
//   String companyName;
//   String noContainer;
//   int statusOrder;
//   int statusDriver;
//   DateTime timeSelesai;
//   DateTime timeMenujuPelabuhan;
//   DateTime timeTibaDipelabuhan;
//   DateTime timeMuatDipelabuhan;
//   DateTime timeMenungguKeluarPelabuhan;
//   DateTime timeMenujuGudangConsignee;
//   DateTime timeTibaGudangConsignee;
//   DateTime timeBongkarMuat;
//   DateTime timeMenujuDepo;
//   DateTime timeTibaDepo;
//   DateTime timeCekContainer;
//   DateTime timeKeluarDepo;
//   DateTime timeMenujuGudangShipper;
//   DateTime timeTibaGudangShipper;
//   DateTime timeMuatBarang;
//   DateTime timeMenujuPelabuhanEx;
//   DateTime timeTibaDipelabuhanEx;
//   String slName;
//   String vesselName;
//   String voyageNumber;
//   String namaPort;
//   String addressPort;
//   String coordinatePort;
//   String namaGudang;
//   String coordinateGudang;
//   String addressGudang;

//   factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
//         gkOrder: json["gk_order"],
//         etd: DateTime.parse(json["ETD"]),
//         namaDriver: json["nama_driver"],
//         noPolisi: json["no_polisi"],
//         companyName: json["company_name"],
//         noContainer: json["no_container"],
//         statusOrder: json["status_order"],
//         statusDriver: json["status_driver"],
//         timeSelesai: DateTime.parse(json["time_selesai"]),
//         timeMenujuPelabuhan: DateTime.parse(json["time_menuju_pelabuhan"]),
//         timeTibaDipelabuhan: DateTime.parse(json["time_tiba_dipelabuhan"]),
//         timeMuatDipelabuhan: DateTime.parse(json["time_muat_dipelabuhan"]),
//         timeMenungguKeluarPelabuhan:
//             DateTime.parse(json["time_menunggu_keluar_pelabuhan"]),
//         timeMenujuGudangConsignee:
//             DateTime.parse(json["time_menuju_gudang_consignee"]),
//         timeTibaGudangConsignee:
//             DateTime.parse(json["time_tiba_gudang_consignee"]),
//         timeBongkarMuat: DateTime.parse(json["time_bongkar_muat"]),
//         timeMenujuDepo: DateTime.parse(json["time_menuju_depo"]),
//         timeTibaDepo: DateTime.parse(json["time_tiba_depo"]),
//         timeCekContainer: DateTime.parse(json["time_cek_container"]),
//         timeKeluarDepo: DateTime.parse(json["time_keluar_depo"]),
//         timeMenujuGudangShipper:
//             DateTime.parse(json["time_menuju_gudang_shipper"]),
//         timeTibaGudangShipper: DateTime.parse(json["time_tiba_gudang_shipper"]),
//         timeMuatBarang: DateTime.parse(json["time_muat_barang"]),
//         timeMenujuPelabuhanEx: DateTime.parse(json["time_menuju_pelabuhan_ex"]),
//         timeTibaDipelabuhanEx: DateTime.parse(json["time_tiba_dipelabuhan_ex"]),
//         slName: json["sl_name"],
//         vesselName: json["vessel_name"],
//         voyageNumber: json["voyage_number"],
//         namaPort: json["nama_port"],
//         addressPort: json["address_port"],
//         coordinatePort: json["coordinate_port"],
//         namaGudang: json["nama_gudang"],
//         coordinateGudang: json["coordinate_gudang"],
//         addressGudang: json["address_gudang"],
//       );

//   Map<String, dynamic> toJson() => {
//         "gk_order": gkOrder,
//         "ETD": etd.toIso8601String(),
//         "nama_driver": namaDriver,
//         "no_polisi": noPolisi,
//         "company_name": companyName,
//         "no_container": noContainer,
//         "status_order": statusOrder,
//         "status_driver": statusDriver,
//         "time_selesai": timeSelesai.toIso8601String(),
//         "time_menuju_pelabuhan": timeMenujuPelabuhan.toIso8601String(),
//         "time_tiba_dipelabuhan": timeTibaDipelabuhan.toIso8601String(),
//         "time_muat_dipelabuhan": timeMuatDipelabuhan.toIso8601String(),
//         "time_menunggu_keluar_pelabuhan":
//             timeMenungguKeluarPelabuhan.toIso8601String(),
//         "time_menuju_gudang_consignee":
//             timeMenujuGudangConsignee.toIso8601String(),
//         "time_tiba_gudang_consignee": timeTibaGudangConsignee.toIso8601String(),
//         "time_bongkar_muat": timeBongkarMuat.toIso8601String(),
//         "time_menuju_depo": timeMenujuDepo.toIso8601String(),
//         "time_tiba_depo": timeTibaDepo.toIso8601String(),
//         "time_cek_container": timeCekContainer.toIso8601String(),
//         "time_keluar_depo": timeKeluarDepo.toIso8601String(),
//         "time_menuju_gudang_shipper": timeMenujuGudangShipper.toIso8601String(),
//         "time_tiba_gudang_shipper": timeTibaGudangShipper.toIso8601String(),
//         "time_muat_barang": timeMuatBarang.toIso8601String(),
//         "time_menuju_pelabuhan_ex": timeMenujuPelabuhanEx.toIso8601String(),
//         "time_tiba_dipelabuhan_ex": timeTibaDipelabuhanEx.toIso8601String(),
//         "sl_name": slName,
//         "vessel_name": vesselName,
//         "voyage_number": voyageNumber,
//         "nama_port": namaPort,
//         "address_port": addressPort,
//         "coordinate_port": coordinatePort,
//         "nama_gudang": namaGudang,
//         "coordinate_gudang": coordinateGudang,
//         "address_gudang": addressGudang,
//       };
// }

// Future<OrderDetail> getOrderDetail(String orderId) async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   String token = pref.getString('token')!;

//   Uri url = Uri.parse(
//       'https://apiflutter.forwarder.boksman.co.id/orderberlangsung/detail/' +
//           orderId);
//   var jsonResponse = await http.get(url, headers: {'token': token});
//   var jsonObject = jsonDecode(jsonResponse.body);

//   var userData = (jsonObject as Map<String, dynamic>)['data'];

//   return OrderDetail.fromJson(userData[0]);
// }

// List orderMessage = [
//   "Pekerjaan diterima.",
//   "Menuju pelabuhan.",
//   "Tiba di pelabuhan.",
//   "Muat di pelabuhan.",
//   "Menunggu keluar pelabuhan.",
//   "Menuju gudang consignee.",
//   "Tiba di gudang consignee.",
//   "Bongkar muat.",
//   "Menuju depo.",
//   "Tiba di depo.",
//   "Cek kontainer.",
//   "Keluar depo",
//   "Menuju gudang shipper",
//   "Tiba digudang shipper",
//   "Muat barang",
//   "Menuju pelabuhan",
//   "Tiba di pelabuhan.",
//   "Selesai",
// ];
