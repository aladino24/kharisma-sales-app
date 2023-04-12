class Provinsi {
  final String id;
  final String name;

  Provinsi({required this.id, required this.name});

  factory Provinsi.fromJson(Map<String, dynamic> json) {
    return Provinsi(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ProvinsiList {
  final String status;
  final String message;
  final List<Provinsi> data;

  ProvinsiList({required this.status, required this.message, required this.data});

  factory ProvinsiList.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Provinsi> provinsiList =
        list.map((i) => Provinsi.fromJson(i)).toList();

    return ProvinsiList(
      status: json['status'],
      message: json['message'],
      data: provinsiList,
    );
  }
}
