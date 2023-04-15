class KelurahanList{
    final String status;
    final String message;
    final List<Kelurahan> data;

    KelurahanList({required this.status, required this.message, required this.data});

    factory KelurahanList.fromJson(Map<String, dynamic> json) {
        var list = json['data'] as List;
        List<Kelurahan> kelurahanList = list.map((i) => Kelurahan.fromJson(i)).toList();

        return KelurahanList(
            status: json['status'],
            message: json['message'],
            data: kelurahanList,
        );
    }
}


class Kelurahan {
   final String id;
    final String name;

    Kelurahan({required this.id, required this.name});

    factory Kelurahan.fromJson(Map<String, dynamic> json) {
      return Kelurahan(
        id: json['id'],
        name: json['name'],
      );
    }
}

