class ProductResult {
  int? code;
  List<Product>? data;
  String? message;

  ProductResult({this.code, this.data, this.message});

  ProductResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(new Product.fromJson(v));
      });
    }
    message = json['message'];
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
  List<Pricelist>? pricelist;

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
      this.productTag,
      this.pricelist});

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
    if (json['pricelist'] != null) {
      pricelist = <Pricelist>[];
      json['pricelist'].forEach((v) {
        pricelist!.add(new Pricelist.fromJson(v));
      });
    }
  }
}

class ProductTag {
  String? name;

  ProductTag({this.name});

  ProductTag.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

}

class Pricelist {
  String? price;
  String? minQuantity;
  String? type;

  Pricelist({this.price, this.minQuantity, this.type});

  Pricelist.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    minQuantity = json['min_quantity'];
    type = json['type'];
  }

}
