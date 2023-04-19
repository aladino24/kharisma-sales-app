class ProvinsiList {
  int? code;
  final String message;
  final List<Provinsi> data;

  ProvinsiList({required this.code, required this.message, required this.data});

  factory ProvinsiList.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Provinsi> provinsiList = list.map((i) => Provinsi.fromJson(i)).toList();

    return ProvinsiList(
      code: json['code'],
      message: json['message'],
      data: provinsiList,
    );
  }
}

class Provinsi {
  final String province_id;
  final String province;

  Provinsi({required this.province_id, required this.province});

  factory Provinsi.fromJson(Map<String, dynamic> json) {
    return Provinsi(
      province_id: json['province_id'],
      province: json['province'],
    );
  }
}


