class KotaList{
    final String status;
    final String message;
    final List<Kota> data;

    KotaList({required this.status, required this.message, required this.data});

    factory KotaList.fromJson(Map<String, dynamic> json) {
        var list = json['data'] as List;
        List<Kota> kotaList = list.map((i) => Kota.fromJson(i)).toList();

        return KotaList(
            status: json['status'],
            message: json['message'],
            data: kotaList,
        );
    }
}


class Kota {
   final String id;
    final String name;

    Kota({required this.id, required this.name});

    factory Kota.fromJson(Map<String, dynamic> json) {
      return Kota(
        id: json['id'],
        name: json['name'],
      );
    }
}

