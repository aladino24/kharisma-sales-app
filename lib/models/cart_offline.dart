class CartOffline {
  final int id;
  final String uuid;
  final String userId;
  final String productId;
  final String productTmplId;
  final String productUomId;
  final String satuan;
  final String satuanStock;
  final int quantity;
  final String price;
  final String totalPrice;
  final String status;
  final String isBuyNow;
  final String isCheckout;
  final String createdAt;
  final String updatedAt;
  final String sisaStock;
  final String productName;
  final String productNameSlug;
  final String unit;
  final String stock;
  final String priceUtama;
  final String labelUtama;

  CartOffline({
    required this.id,
    required this.uuid,
    required this.userId,
    required this.productId,
    required this.productTmplId,
    required this.productUomId,
    required this.satuan,
    required this.satuanStock,
    required this.quantity,
    required this.price,
    required this.totalPrice,
    required this.status,
    required this.isBuyNow,
    required this.isCheckout,
    required this.createdAt,
    required this.updatedAt,
    required this.sisaStock,
    required this.productName,
    required this.productNameSlug,
    required this.unit,
    required this.stock,
    required this.priceUtama,
    required this.labelUtama,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uuid': uuid,
      'user_id': userId,
      'product_id': productId,
      'product_tmpl_id': productTmplId,
      'product_uom_id': productUomId,
      'satuan': satuan,
      'satuan_stock': satuanStock,
      'quantity': quantity,
      'price': price,
      'total_price': totalPrice,
      'status': status,
      'is_buy_now': isBuyNow ,
      'is_checkout': isCheckout,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'sisa_stock': sisaStock,
      'product_name': productName,
      'product_name_slug': productNameSlug,
      'unit': unit,
      'stock': stock,
      'price_utama': priceUtama,
      'label_utama': labelUtama,
    };
  }

  factory CartOffline.fromMap(Map<String, dynamic> map) {
    return CartOffline(
      id: map['id'],
      uuid: map['uuid'],
      userId: map['user_id'],
      productId: map['product_id'],
      productTmplId: map['product_tmpl_id'],
      productUomId: map['product_uom_id'],
      satuan: map['satuan'],
      satuanStock: map['satuan_stock'],
      quantity: map['quantity'],
      price: map['price'],
      totalPrice: map['total_price'],
      status: map['status'],
      isBuyNow: map['is_buy_now'],
      isCheckout: map['is_checkout'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      sisaStock: map['sisa_stock'],
      productName: map['product_name'],
      productNameSlug: map['product_name_slug'],
      unit: map['unit'],
      stock: map['stock'],
      priceUtama: map['price_utama'],
      labelUtama: map['label_utama'],
    );
  }
}

class ProductCart {
  final int id;
  final String productId;
  final String productTmplId;
  final String productUomId;
  final String productTagId;
  final String sku;
  final String productName;
  final String productNameSlug;
  final String unit;
  final String stock;
  final String priceUtama;
  final String labelUtama;
  final ProductTagCart productTag;

  ProductCart({
    required this.id,
    required this.productId,
    required this.productTmplId,
    required this.productUomId,
    required this.productTagId,
    required this.sku,
    required this.productName,
    required this.productNameSlug,
    required this.unit,
    required this.stock,
    required this.priceUtama,
    required this.labelUtama,
    required this.productTag,
  });

  factory ProductCart.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('product')) {
    // Jika kunci 'product' ada dalam map, ekstrak data dari objek tersebut
    return ProductCart(
      id: map['product']['id'],
      productId: map['product']['product_id'],
      productTmplId: map['product']['product_tmpl_id'],
      productUomId: map['product']['product_uom_id'],
      productTagId: map['product']['product_tag_id'],
      sku: map['product']['sku'],
      productName: map['product']['product_name'],
      productNameSlug: map['product']['product_name_slug'],
      unit: map['product']['unit'],
      stock: map['product']['stock'].toString(),
      priceUtama: map['product']['price_utama'].toString(),
      labelUtama: map['product']['label_utama'],
      productTag: ProductTagCart.fromMap(map['product']['product_tag']),
    );
  } else {
    // Tangani kasus ketika kunci 'product' null atau tidak ada
    return ProductCart(
      id: 0, // atau tetapkan nilai default lainnya
      productId: '',
      productTmplId: '',
      productUomId: '',
      productTagId: '',
      sku: '',
      productName: '',
      productNameSlug: '',
      unit: '',
      stock: '0',
      priceUtama: '0',
      labelUtama: '',
      productTag: ProductTagCart(productTagId: '', name: ''),
    );
  }
  }
}

class ProductTagCart {
  final String productTagId;
  final String name;

  ProductTagCart({required this.productTagId, required this.name});

  factory ProductTagCart.fromMap(Map<String, dynamic> map) {
    return ProductTagCart(
      productTagId: map['product_tag_id'],
      name: map['name'],
    );
  }
}
