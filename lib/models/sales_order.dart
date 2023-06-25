class SalesOrderResult {
  int? code;
  List<SalesOrder>? data;
  String? message;

  SalesOrderResult({this.code, this.data, this.message});

  SalesOrderResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <SalesOrder>[];
      json['data'].forEach((v) {
        data!.add(new SalesOrder.fromJson(v));
      });
    }
    message = json['message'];
  }

}

class SalesOrder {
  int? id;
  String? uuid;
  String? userId;
  dynamic salesId;
  String? odooOrderId;
  String? ongkosKirim;
  String? totalHargaProduk;
  String? totalBerat;
  String? totalHarga;
  String? status;
  String? jasaPengiriman;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdBy;
  dynamic updatedBy;
  dynamic deletedBy;
  List<SalesOrderProduct>? salesOrderProduct;

  SalesOrder(
      {this.id,
      this.uuid,
      this.userId,
      this.salesId,
      this.odooOrderId,
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
      this.deletedBy,
      this.salesOrderProduct});

  SalesOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    userId = json['user_id'];
    salesId = json['sales_id'];
    odooOrderId = json['odoo_order_id'];
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
    if (json['sales_order_product'] != null) {
      salesOrderProduct = <SalesOrderProduct>[];
      json['sales_order_product'].forEach((v) {
        salesOrderProduct!.add(new SalesOrderProduct.fromJson(v));
      });
    }
  }

}

class SalesOrderProduct {
  int? id;
  String? salesOrderId;
  String? cartId;
  String? productId;
  String? quantity;
  String? harga;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdBy;
  dynamic updatedBy;
  dynamic deletedBy;
  Product? product;

  SalesOrderProduct(
      {this.id,
      this.salesOrderId,
      this.cartId,
      this.productId,
      this.quantity,
      this.harga,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.createdBy,
      this.updatedBy,
      this.deletedBy,
      this.product
    });

  SalesOrderProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    salesOrderId = json['sales_order_id'];
    cartId = json['cart_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    harga = json['harga'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedBy = json['deleted_by'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }
}

class Product {
  int? id;
  String? productId;
  String? productTmplId;
  String? productTagId;
  String? productUomId;
  String? sku;
  String? productName;
  String? productNameSlug;
  dynamic gdImageName;
  dynamic gdImageMimetype;
  dynamic gdImagePath;
  dynamic gdImageSmallName;
  dynamic gdImageSmallMimetype;
  dynamic gdImageSmallPath;
  String? unit;
  String? weight;
  String? stock;

  Product(
      {this.id,
      this.productId,
      this.productTmplId,
      this.productTagId,
      this.productUomId,
      this.sku,
      this.productName,
      this.productNameSlug,
      this.gdImageName,
      this.gdImageMimetype,
      this.gdImagePath,
      this.gdImageSmallName,
      this.gdImageSmallMimetype,
      this.gdImageSmallPath,
      this.unit,
      this.weight,
      this.stock});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productTmplId = json['product_tmpl_id'];
    productTagId = json['product_tag_id'];
    productUomId = json['product_uom_id'];
    sku = json['sku'];
    productName = json['product_name'];
    productNameSlug = json['product_name_slug'];
    gdImageName = json['gd_image_name'];
    gdImageMimetype = json['gd_image_mimetype'];
    gdImagePath = json['gd_image_path'];
    gdImageSmallName = json['gd_image_small_name'];
    gdImageSmallMimetype = json['gd_image_small_mimetype'];
    gdImageSmallPath = json['gd_image_small_path'];
    unit = json['unit'];
    weight = json['weight'];
    stock = json['stock'];
  }
}