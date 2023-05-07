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
  String? quantity;
  String? price;
  String? totalPrice;
  String? status;
  String? isCheckout;
  String? createdAt;
  String? updatedAt;
  Product? product;

  CartProduct(
      {this.id,
      this.uuid,
      this.userId,
      this.productId,
      this.quantity,
      this.price,
      this.totalPrice,
      this.status,
      this.isCheckout,
      this.createdAt,
      this.updatedAt,
      this.product});

  CartProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    userId = json['user_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    price = json['price'];
    totalPrice = json['total_price'];
    status = json['status'];
    isCheckout = json['is_checkout'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

}

class Product {
  int? id;
  String? productId;
  String? productTmplId;
  String? productTagId;
  String? sku;
  String? productName;
  String? productNameSlug;
  String? image;
  String? imageSmall;
  String? unit;
  String? weight;
  String? stock;
  ProductTag? productTag;

  Product(
      {this.id,
      this.productId,
      this.productTmplId,
      this.productTagId,
      this.sku,
      this.productName,
      this.productNameSlug,
      this.image,
      this.imageSmall,
      this.unit,
      this.weight,
      this.stock,
      this.productTag});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productTmplId = json['product_tmpl_id'];
    productTagId = json['product_tag_id'];
    sku = json['sku'];
    productName = json['product_name'];
    productNameSlug = json['product_name_slug'];
    image = json['image'];
    imageSmall = json['image_small'];
    unit = json['unit'];
    weight = json['weight'];
    stock = json['stock'];
    productTag = json['product_tag'] != null
        ? new ProductTag.fromJson(json['product_tag'])
        : null;
  }

}

class ProductTag {
  String? name;

  ProductTag({this.name});

  ProductTag.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

}
