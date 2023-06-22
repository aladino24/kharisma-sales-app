class CheckpriceResult {
  int? code;
  Checkprice? data;
  String? message;

  CheckpriceResult({this.code, this.data, this.message});

  CheckpriceResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Checkprice.fromJson(json['data']) : null;
    message = json['message'];
  }

}

class Checkprice {
  String? price;
  int? totalPrice;

  Checkprice({this.price, this.totalPrice});

  Checkprice.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    totalPrice = json['total_price'];
  }

}
