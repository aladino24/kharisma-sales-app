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
  String? color;
  String? createdAtDesc;
  String? statusDesc;
  List<SalesOrderProduct>? salesOrderProduct;

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
      this.deletedBy,
      this.color,
      this.createdAtDesc,
      this.statusDesc,
      this.salesOrderProduct});

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
    color = json['color'];
    createdAtDesc = json['created_at_desc'];
    statusDesc = json['status_desc'];
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
  String? productTmplId;
  String? productUomId;
  String? quantity;
  String? harga;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? createdBy;
  String? updatedBy;
  String? deletedBy;
  int? totalHargaProduk;
  Product? product;
  ProductUom? productUom;

  SalesOrderProduct(
      {this.id,
      this.salesOrderId,
      this.cartId,
      this.productId,
      this.productTmplId,
      this.productUomId,
      this.quantity,
      this.harga,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.createdBy,
      this.updatedBy,
      this.deletedBy,
      this.totalHargaProduk,
      this.product,
      this.productUom});

  SalesOrderProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    salesOrderId = json['sales_order_id'];
    cartId = json['cart_id'];
    productId = json['product_id'];
    productTmplId = json['product_tmpl_id'];
    productUomId = json['product_uom_id'];
    quantity = json['quantity'];
    harga = json['harga'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedBy = json['deleted_by'];
    totalHargaProduk = json['total_harga_produk'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    productUom = json['product_uom'] != null
        ? new ProductUom.fromJson(json['product_uom'])
        : null;
  }

}

class Product {
  int? id;
  String? productId;
  String? productTmplId;
  String? productUomId;
  String? productTagId;
  String? arrayProductTagId;
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
  dynamic deletedAt;
  int? isWishlist;
  String? priceUtama;
  String? labelUtama;

  Product(
      {this.id,
      this.productId,
      this.productTmplId,
      this.productUomId,
      this.productTagId,
      this.arrayProductTagId,
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
      this.stock,
      this.deletedAt,
      this.isWishlist,
      this.priceUtama,
      this.labelUtama});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productTmplId = json['product_tmpl_id'];
    productUomId = json['product_uom_id'];
    productTagId = json['product_tag_id'];
    arrayProductTagId = json['array_product_tag_id'];
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
    deletedAt = json['deleted_at'];
    isWishlist = json['is_wishlist'];
    priceUtama = json['price_utama'];
    labelUtama = json['label_utama'];
  }

}

class ProductUom {
  int? id;
  String? productTmplId;
  String? productUomId;
  String? label;
  String? stock;
  String? type;
  List<ProductPricelist>? productPricelist;

  ProductUom(
      {this.id,
      this.productTmplId,
      this.productUomId,
      this.label,
      this.stock,
      this.type,
      this.productPricelist});

  ProductUom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productTmplId = json['product_tmpl_id'];
    productUomId = json['product_uom_id'];
    label = json['label'];
    stock = json['stock'];
    type = json['type'];
    if (json['product_pricelist'] != null) {
      productPricelist = <ProductPricelist>[];
      json['product_pricelist'].forEach((v) {
        productPricelist!.add(new ProductPricelist.fromJson(v));
      });
    }
  }

}

class ProductPricelist {
  int? id;
  String? productTmplId;
  String? productUomId;
  String? price;
  String? minQuantity;

  ProductPricelist(
      {this.id,
      this.productTmplId,
      this.productUomId,
      this.price,
      this.minQuantity});

  ProductPricelist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productTmplId = json['product_tmpl_id'];
    productUomId = json['product_uom_id'];
    price = json['price'];
    minQuantity = json['min_quantity'];
  }

}
