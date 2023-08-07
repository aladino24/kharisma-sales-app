class CartOffline {
  int? id;
  String? uuid;
  String? jumlahStock;

  CartOffline({
    this.id,
    this.uuid,
    this.jumlahStock,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uuid': uuid,
      'jumlah_stock': jumlahStock,
    };
  }

  factory CartOffline.fromMap(Map<String, dynamic> map) {
    return CartOffline(
      id: map['id'],
      uuid: map['uuid'],
      jumlahStock: map['jumlah_stock'],
    );
  }
}
