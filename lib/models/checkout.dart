class CheckoutResult {
  int? code;
  List<Checkout>? data;
  String? message;

  CheckoutResult({this.code, this.data, this.message});

  CheckoutResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Checkout>[];
      json['data'].forEach((v) {
        data!.add(new Checkout.fromJson(v));
      });
    }
    message = json['message'];
  }

}

class Checkout {
  int? id;
  String? uuid;
  String? userId;
  String? productId;
  String? quantity;
  String? price;
  String? totalPrice;
  String? status;
  String? isBuyNow;
  String? isCheckout;
  String? createdAt;
  String? updatedAt;
  ProductCheckout? product;

  Checkout(
      {this.id,
      this.uuid,
      this.userId,
      this.productId,
      this.quantity,
      this.price,
      this.totalPrice,
      this.status,
      this.isBuyNow,
      this.isCheckout,
      this.createdAt,
      this.updatedAt,
      this.product});

  Checkout.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    userId = json['user_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    price = json['price'];
    totalPrice = json['total_price'];
    status = json['status'];
    isBuyNow = json['is_buy_now'];
    isCheckout = json['is_checkout'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
        json['product'] != null ? new ProductCheckout.fromJson(json['product']) : null;
  }

}

class ProductCheckout {
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
  ProductTag? productTag;

  ProductCheckout(
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
      this.stock,
      this.productTag});

  ProductCheckout.fromJson(Map<String, dynamic> json) {
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
    productTag = json['product_tag'] != null
        ? new ProductTag.fromJson(json['product_tag'])
        : null;
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
