class KecamatanList{
    final String status;
    final String message;
    final List<Kecamatan> data;

    KecamatanList({required this.status, required this.message, required this.data});

    factory KecamatanList.fromJson(Map<String, dynamic> json) {
        var list = json['data'] as List;
        List<Kecamatan> kecamatanList = list.map((i) => Kecamatan.fromJson(i)).toList();

        return KecamatanList(
            status: json['status'],
            message: json['message'],
            data: kecamatanList,
        );
    }
}


class Kecamatan {
   final String id;
    final String name;

    Kecamatan({required this.id, required this.name});

    factory Kecamatan.fromJson(Map<String, dynamic> json) {
      return Kecamatan(
        id: json['id'],
        name: json['name'],
      );
    }
}

