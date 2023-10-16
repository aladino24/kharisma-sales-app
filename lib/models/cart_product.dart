import 'package:get/get.dart';

class CartProductResult {
  int? code;
  List<CartProduct>? data;
  String? message;

  CartProductResult({this.code, this.data, this.message});

  CartProductResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <CartProduct>[];
      json['data'].forEach((v) {
        data!.add(new CartProduct.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class CartProduct {
  int? id;
  String? uuid;
  String? userId;
  String? productId;
  String? productTmplId;
  String? productUomId;
  String? satuan;
  String? satuanStock;
  String? quantity;
  bool isSelected = false;
  RxString? price;
  String? totalPrice;
  String? status;
  String? isBuyNow;
  String? isCheckout;
  String? createdAt;
  String? updatedAt;
  int? sisaStock;
  Product? product;

  CartProduct(
      {this.id,
      this.uuid,
      this.userId,
      this.productId,
      this.productTmplId,
      this.productUomId,
      this.satuan,
      this.satuanStock,
      this.quantity,
      this.price,
      this.totalPrice,
      this.status,
      this.isBuyNow,
      this.isCheckout,
      this.createdAt,
      this.updatedAt,
      this.sisaStock,
      this.product});

  CartProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    userId = json['user_id'];
    productId = json['product_id'];
    productTmplId = json['product_tmpl_id'];
    productUomId = json['product_uom_id'];
    satuan = json['satuan'];
    satuanStock = json['satuan_stock'];
    quantity = json['quantity'];
    price = RxString(json['price']);
    totalPrice = json['total_price'];
    status = json['status'];
    isBuyNow = json['is_buy_now'];
    isCheckout = json['is_checkout'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sisaStock = json['sisa_stock'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }
}

class Product {
  int? id;
  String? productId;
  String? productTmplId;
  String? productUomId;
  String? productTagId;
  String? sku;
  String? productName;
  String? productNameSlug;
  String? gdImageName;
  String? gdImageMimetype;
  String? gdImagePath;
  String? gdImageSmallName;
  String? gdImageSmallMimetype;
  String? gdImageSmallPath;
  String? unit;
  String? weight;
  String? stock;
  int? isWishlist;
  String? priceUtama;
  String? labelUtama;
  List<ProductUom>? productUom;
  ProductTag? productTag;

  Product(
      {this.id,
      this.productId,
      this.productTmplId,
      this.productUomId,
      this.productTagId,
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
      this.isWishlist,
      this.priceUtama,
      this.labelUtama,
      this.productTag,
      this.productUom});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productTmplId = json['product_tmpl_id'];
    productUomId = json['product_uom_id'];
    productTagId = json['product_tag_id'];
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
    isWishlist = json['is_wishlist'];
    priceUtama = json['price_utama'];
    labelUtama = json['label_utama'];
    if (json['product_uom'] != null) {
      productUom = <ProductUom>[];
      json['product_uom'].forEach((v) {
        productUom!.add(new ProductUom.fromJson(v));
      });
    }
    productTag = json['product_tag'] != null
        ? new ProductTag.fromJson(json['product_tag'])
        : null;
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

class ProductTag {
  String? productTagId;
  String? name;

  ProductTag({this.productTagId, this.name});

  ProductTag.fromJson(Map<String, dynamic> json) {
    productTagId = json['product_tag_id'];
    name = json['name'];
  }
}
