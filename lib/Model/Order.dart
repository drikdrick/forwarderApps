class Order {
  String gkOrder;
  String eTD;
  String noContainer;
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

  Order(
      {this.gkOrder,
      this.eTD,
      this.noContainer,
      this.statusOrder,
      this.slName,
      this.vesselName,
      this.voyageNumber,
      this.name,
      this.noPolisi,
      this.namaPort,
      this.addressPort,
      this.namaGudang,
      this.addressGudang});

  Order.fromJson(Map<String, dynamic> json) {
    gkOrder = json['gk_order'];
    eTD = json['ETD'];
    noContainer = json['no_container'];
    statusOrder = json['status_order'];
    slName = json['sl_name'];
    vesselName = json['vessel_name'];
    voyageNumber = json['voyage_number'];
    name = json['name'];
    noPolisi = json['no_polisi'];
    namaPort = json['nama_port'];
    addressPort = json['address_port'];
    namaGudang = json['nama_gudang'];
    addressGudang = json['address_gudang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gk_order'] = this.gkOrder;
    data['ETD'] = this.eTD;
    data['no_container'] = this.noContainer;
    data['status_order'] = this.statusOrder;
    data['sl_name'] = this.slName;
    data['vessel_name'] = this.vesselName;
    data['voyage_number'] = this.voyageNumber;
    data['name'] = this.name;
    data['no_polisi'] = this.noPolisi;
    data['nama_port'] = this.namaPort;
    data['address_port'] = this.addressPort;
    data['nama_gudang'] = this.namaGudang;
    data['address_gudang'] = this.addressGudang;
    return data;
  }
}