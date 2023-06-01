class CategoryResult {
  int? code;
  List<Category>? data;
  String? message;

  CategoryResult({this.code, this.data, this.message});

  CategoryResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Category>[];
      json['data'].forEach((v) {
        data!.add(new Category.fromJson(v));
      });
    }
    message = json['message'];
  }

}

class Category {
  String? productTagId;
  String? name;

  Category({this.productTagId, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    productTagId = json['product_tag_id'];
    name = json['name'];
  }

}
