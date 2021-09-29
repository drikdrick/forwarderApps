import 'dart:convert';

DetailInvoice detailInvoiceFromJson(String str) =>
    DetailInvoice.fromJson(json.decode(str));

String detailInvoiceToJson(DetailInvoice data) => json.encode(data.toJson());

class DetailInvoice {
  DetailInvoice({
    required this.success,
    required this.message,
    required this.dataCustomer,
    required this.dataOrder,
  });

  bool success;
  String message;
  List<DataCustomer> dataCustomer;
  List<DataOrder> dataOrder;

  factory DetailInvoice.fromJson(Map<String, dynamic> json) => DetailInvoice(
        success: json["success"],
        message: json["message"],
        dataCustomer: List<DataCustomer>.from(
            json["data_customer"].map((x) => DataCustomer.fromJson(x))),
        dataOrder: List<DataOrder>.from(
            json["data_order"].map((x) => DataOrder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data_customer":
            List<dynamic>.from(dataCustomer.map((x) => x.toJson())),
        "data_order": List<dynamic>.from(dataOrder.map((x) => x.toJson())),
      };
}

class DataCustomer {
  DataCustomer({
    required this.idCustomer,
    required this.firstLogin,
    required this.company,
    required this.address,
    required this.district,
    required this.city,
    required this.state,
    required this.country,
    required this.zipCode,
    required this.contact,
    required this.username,
    required this.password,
    required this.phone,
    required this.telp,
    required this.email,
    required this.coordinate,
    required this.level,
    required this.entryDate,
    required this.statusCustomer,
    required this.custType,
    required this.systemInvoice,
    required this.bulanSystemInvoice,
    required this.employeeNumberAe,
    required this.memberSalesSupportId,
    required this.status,
    required this.createDate,
    required this.updateDateStatus,
    required this.idAdminMpm,
    required this.npwpNumber,
    required this.portId,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
    required this.deletedAt,
    required this.deletedBy,
    required this.dueDateInvoice,
    required this.vendorNumber,
    required this.vendorCode,
    required this.vatInvoice,
    required this.financeEmail,
    required this.phase,
    required this.companyTypeId,
    required this.website,
    required this.personalEmail,
    required this.isSopData,
    required this.verifiedBy,
    required this.rejectedBy,
    required this.dueDate,
    required this.invoiceDate,
    required this.jobOrder,
    required this.bookingCode,
    required this.invoiceAmount,
    required this.terbilangInd,
    required this.terbilangEng,
    required this.totalVat,
  });

  int idCustomer;
  int firstLogin;
  String company;
  String address;
  dynamic district;
  String city;
  String state;
  String country;
  int zipCode;
  String contact;
  String username;
  String password;
  String phone;
  String telp;
  String email;
  String coordinate;
  dynamic level;
  DateTime entryDate;
  int statusCustomer;
  String custType;
  dynamic systemInvoice;
  dynamic bulanSystemInvoice;
  String employeeNumberAe;
  int memberSalesSupportId;
  int status;
  dynamic createDate;
  dynamic updateDateStatus;
  dynamic idAdminMpm;
  dynamic npwpNumber;
  String portId;
  DateTime createdAt;
  String createdBy;
  DateTime updatedAt;
  dynamic updatedBy;
  dynamic deletedAt;
  dynamic deletedBy;
  String dueDateInvoice;
  dynamic vendorNumber;
  dynamic vendorCode;
  String vatInvoice;
  String financeEmail;
  int phase;
  int companyTypeId;
  dynamic website;
  dynamic personalEmail;
  int isSopData;
  int verifiedBy;
  int rejectedBy;
  DateTime dueDate;
  DateTime invoiceDate;
  String jobOrder;
  String bookingCode;
  String invoiceAmount;
  String terbilangInd;
  String terbilangEng;
  String totalVat;

  factory DataCustomer.fromJson(Map<String, dynamic> json) => DataCustomer(
        idCustomer: json["id_customer"],
        firstLogin: json["first_login"],
        company: json["company"],
        address: json["address"],
        district: json["district"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipCode: json["zip_code"],
        contact: json["contact"],
        username: json["username"],
        password: json["password"],
        phone: json["phone"],
        telp: json["telp"],
        email: json["email"],
        coordinate: json["coordinate"],
        level: json["level"],
        entryDate: DateTime.parse(json["entry_date"]),
        statusCustomer: json["status_customer"],
        custType: json["cust_type"],
        systemInvoice: json["system_invoice"],
        bulanSystemInvoice: json["bulan_system_invoice"],
        employeeNumberAe: json["employee_number_ae"],
        memberSalesSupportId: json["member_sales_support_id"],
        status: json["status"],
        createDate: json["create_date"],
        updateDateStatus: json["update_date_status"],
        idAdminMpm: json["id_admin_mpm"],
        npwpNumber: json["npwp_number"],
        portId: json["port_id"],
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: DateTime.parse(json["updated_at"]),
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        deletedBy: json["deleted_by"],
        dueDateInvoice: json["due_date_invoice"],
        vendorNumber: json["vendor_number"],
        vendorCode: json["vendor_code"],
        vatInvoice: json["vat_invoice"],
        financeEmail: json["finance_email"],
        phase: json["phase"],
        companyTypeId: json["company_type_id"],
        website: json["website"],
        personalEmail: json["personal_email"],
        isSopData: json["is_sop_data"],
        verifiedBy: json["verified_by"],
        rejectedBy: json["rejected_by"],
        dueDate: DateTime.parse(json["due_date"]),
        invoiceDate: DateTime.parse(json["invoice_date"]),
        jobOrder: json["job_order"],
        bookingCode: json["booking_code"],
        invoiceAmount: json["invoice_amount"],
        terbilangInd: json["terbilang_ind"],
        terbilangEng: json["terbilang_eng"],
        totalVat: json["total_vat"],
      );

  Map<String, dynamic> toJson() => {
        "id_customer": idCustomer,
        "first_login": firstLogin,
        "company": company,
        "address": address,
        "district": district,
        "city": city,
        "state": state,
        "country": country,
        "zip_code": zipCode,
        "contact": contact,
        "username": username,
        "password": password,
        "phone": phone,
        "telp": telp,
        "email": email,
        "coordinate": coordinate,
        "level": level,
        "entry_date": entryDate.toIso8601String(),
        "status_customer": statusCustomer,
        "cust_type": custType,
        "system_invoice": systemInvoice,
        "bulan_system_invoice": bulanSystemInvoice,
        "employee_number_ae": employeeNumberAe,
        "member_sales_support_id": memberSalesSupportId,
        "status": status,
        "create_date": createDate,
        "update_date_status": updateDateStatus,
        "id_admin_mpm": idAdminMpm,
        "npwp_number": npwpNumber,
        "port_id": portId,
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt.toIso8601String(),
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "deleted_by": deletedBy,
        "due_date_invoice": dueDateInvoice,
        "vendor_number": vendorNumber,
        "vendor_code": vendorCode,
        "vat_invoice": vatInvoice,
        "finance_email": financeEmail,
        "phase": phase,
        "company_type_id": companyTypeId,
        "website": website,
        "personal_email": personalEmail,
        "is_sop_data": isSopData,
        "verified_by": verifiedBy,
        "rejected_by": rejectedBy,
        "due_date": dueDate.toIso8601String(),
        "invoice_date": invoiceDate.toIso8601String(),
        "job_order": jobOrder,
        "booking_code": bookingCode,
        "invoice_amount": invoiceAmount,
        "terbilang_ind": terbilangInd,
        "terbilang_eng": terbilangEng,
        "total_vat": totalVat,
      };
}

class DataOrder {
  DataOrder({
    required this.gkOrder,
    required this.containerSize,
    required this.noPolisi,
    required this.containerNumber,
    required this.typeIoOrder,
    required this.origin,
    required this.destination,
    required this.grandtotal,
    required this.hargaDasar,
    required this.slVv,
  });

  String gkOrder;
  String containerSize;
  String noPolisi;
  String containerNumber;
  int typeIoOrder;
  String origin;
  String destination;
  String grandtotal;
  String hargaDasar;
  String slVv;

  factory DataOrder.fromJson(Map<String, dynamic> json) => DataOrder(
        gkOrder: json["gk_order"],
        containerSize: json["container_size"],
        noPolisi: json["no_polisi"],
        containerNumber: json["container_number"],
        typeIoOrder: json["type_io_order"],
        origin: json["origin"],
        destination: json["destination"],
        grandtotal: json["grandtotal"],
        hargaDasar: json["harga_dasar"],
        slVv: json["sl_vv"],
      );

  Map<String, dynamic> toJson() => {
        "gk_order": gkOrder,
        "container_size": containerSize,
        "no_polisi": noPolisi,
        "container_number": containerNumber,
        "type_io_order": typeIoOrder,
        "origin": origin,
        "destination": destination,
        "grandtotal": grandtotal,
        "harga_dasar": hargaDasar,
        "sl_vv": slVv,
      };
}

//Services

