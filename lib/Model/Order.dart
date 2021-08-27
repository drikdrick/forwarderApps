
class Order {
  String orderId;
  String noContainer;
  String namaDriver;
  String noPol;
  String asal;
  String tujuan;
  String status;
  String shipLine;
  String jadwal;

  Order({
    required this.orderId,
    required this.noContainer,
    required this.namaDriver,
    required this.noPol,
    required this.asal,
    required this.tujuan,
    required this.status,
    required this.shipLine,
    required this.jadwal,
  });
}

var orderList = [
  Order(
    orderId: 'GK-123456789',
    noContainer: 'TUC-12345',
    namaDriver: 'Joko',
    noPol: 'B 055 Q',
    asal: 'Tanjung Priok',
    tujuan: 'Karawang',
    status: 'Ongoing',
    shipLine: 'Evergreen',
    jadwal: '10:00 WIB',
  ),
  Order(
    orderId: 'GK-123456790',
    noContainer: 'TUC-12345',
    namaDriver: 'Joko',
    noPol: 'B 055 Q',
    asal: 'Tanjung Priok',
    tujuan: 'Karawang',
    status: 'Ongoing',
    shipLine: 'Evergreen',
    jadwal: '10:00 WIB',
  ),
  Order(
    orderId: 'GK-123456791',
    noContainer: 'TUC-12345',
    namaDriver: 'Joko',
    noPol: 'B 055 Q',
    asal: 'Tanjung Priok',
    tujuan: 'Karawang',
    status: 'Ongoing',
    shipLine: 'Evergreen',
    jadwal: '10:00 WIB',
  ),
  Order(
    orderId: 'GK-543',
    noContainer: 'TUC-12345',
    namaDriver: 'Joko',
    noPol: 'B 055 Q',
    asal: 'Tanjung Priok',
    tujuan: 'Karawang',
    status: 'Pending',
    shipLine: 'Evergreen',
    jadwal: '10:00 WIB',
  ),
  Order(
    orderId: 'GK-76543',
    noContainer: 'TUC-12345',
    namaDriver: 'Joko',
    noPol: 'B 055 Q',
    asal: 'Tanjung Priok',
    tujuan: 'Karawang',
    status: 'Pending',
    shipLine: 'Evergreen',
    jadwal: '10:00 WIB',
  ),
  Order(
    orderId: 'GK-76543',
    noContainer: 'TUC-12345',
    namaDriver: 'Joko',
    noPol: 'B 055 Q',
    asal: 'Tanjung Priok',
    tujuan: 'Karawang',
    status: 'Pending',
    shipLine: 'Evergreen',
    jadwal: '10:00 WIB',
  ),
  Order(
    orderId: 'GK-23r221',
    noContainer: 'TUC-12345',
    namaDriver: 'Joko',
    noPol: 'B 055 Q',
    asal: 'Tanjung Priok',
    tujuan: 'Karawang',
    status: 'Pending',
    shipLine: 'Evergreen',
    jadwal: '10:00 WIB',
  ),
  Order(
    orderId: 'GK-543452',
    noContainer: 'TUC-12345',
    namaDriver: 'Joko',
    noPol: 'B 055 Q',
    asal: 'Tanjung Priok',
    tujuan: 'Karawang',
    status: 'Selesai',
    shipLine: 'Evergreen',
    jadwal: '10:00 WIB',
  ),
  Order(
    orderId: 'GK-23rqv',
    noContainer: 'TUC-12345',
    namaDriver: 'Joko',
    noPol: 'B 055 Q',
    asal: 'Tanjung Priok',
    tujuan: 'Karawang',
    status: 'Selesai',
    shipLine: 'Evergreen',
    jadwal: '10:00 WIB',
  ),
  Order(
    orderId: 'GK-vwff23',
    noContainer: 'TUC-12345',
    namaDriver: 'Joko',
    noPol: 'B 055 Q',
    asal: 'Tanjung Priok',
    tujuan: 'Karawang',
    status: 'Selesai',
    shipLine: 'Evergreen',
    jadwal: '10:00 WIB',
  ),
  Order(
    orderId: 'GK-3r3cq',
    noContainer: 'TUC-12345',
    namaDriver: 'Joko',
    noPol: 'B 055 Q',
    asal: 'Tanjung Priok',
    tujuan: 'Karawang',
    status: 'Selesai',
    shipLine: 'Evergreen',
    jadwal: '10:00 WIB',
  ),
  Order(
    orderId: 'GK-2332fdw',
    noContainer: 'TUC-12345',
    namaDriver: 'Joko',
    noPol: 'B 055 Q',
    asal: 'Tanjung Priok',
    tujuan: 'Karawang',
    status: 'Dibatalkan',
    shipLine: 'Evergreen',
    jadwal: '10:00 WIB',
  ),
];

List<String> status = [
  'Pending',
  'Ongoing',
  'Selesai',
  'Dibatalkan',
];
