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
  ProductTag? productTag;
  List<ProductUom>? productUom;

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
    productTag = json['product_tag'] != null
        ? new ProductTag.fromJson(json['product_tag'])
        : null;
    if (json['product_uom'] != null) {
      productUom = <ProductUom>[];
      json['product_uom'].forEach((v) {
        productUom!.add(new ProductUom.fromJson(v));
      });
    }
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
