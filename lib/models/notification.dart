class NotificationResult {
  int? code;
  List<NotificationItem>? data;
  String? message;

  NotificationResult({this.code, this.data, this.message});

  NotificationResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <NotificationItem>[];
      json['data'].forEach((v) {
        data!.add(new NotificationItem.fromJson(v));
      });
    }
    message = json['message'];
  }

}

class NotificationItem{
  int? id;
  String? notificationType;
  String? isNew;
  String? judul;
  String? pengumuman;
  String? salesOrderId;
  String? createdAt;
  String? notificationTitle;
  String? notificationBody;
  String? customDatetime;
  SalesOrder? salesOrder;

  NotificationItem(
      {this.id,
      this.notificationType,
      this.isNew,
      this.judul,
      this.pengumuman,
      this.salesOrderId,
      this.createdAt,
      this.notificationTitle,
      this.notificationBody,
      this.customDatetime,
      this.salesOrder});

  NotificationItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationType = json['notification_type'];
    isNew = json['is_new'];
    judul = json['judul'];
    pengumuman = json['pengumuman'];
    salesOrderId = json['sales_order_id'];
    createdAt = json['created_at'];
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    customDatetime = json['custom_datetime'];
    salesOrder = json['sales_order'] != null
        ? new SalesOrder.fromJson(json['sales_order'])
        : null;
  }

}

class SalesOrder {
  int? id;
  String? uuid;
  String? userId;
  String? salesId;
  String? odooOrderId;
  String? noInvoice;
  String? ongkosKirim;
  String? totalHargaProduk;
  String? totalBerat;
  String? totalHarga;
  String? status;
  String? jasaPengiriman;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? createdBy;
  String? updatedBy;
  String? deletedBy;

  SalesOrder(
      {this.id,
      this.uuid,
      this.userId,
      this.salesId,
      this.odooOrderId,
      this.noInvoice,
      this.ongkosKirim,
      this.totalHargaProduk,
      this.totalBerat,
      this.totalHarga,
      this.status,
      this.jasaPengiriman,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.createdBy,
      this.updatedBy,
      this.deletedBy});

  SalesOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    userId = json['user_id'];
    salesId = json['sales_id'];
    odooOrderId = json['odoo_order_id'];
    noInvoice = json['no_invoice'];
    ongkosKirim = json['ongkos_kirim'];
    totalHargaProduk = json['total_harga_produk'];
    totalBerat = json['total_berat'];
    totalHarga = json['total_harga'];
    status = json['status'];
    jasaPengiriman = json['jasa_pengiriman'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedBy = json['deleted_by'];
  }

}
