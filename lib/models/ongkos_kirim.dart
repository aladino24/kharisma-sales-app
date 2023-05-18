class OngkosKirimResult {
  int? code;
  List<OngkosKirim>? data;
  String? message;

  OngkosKirimResult({this.code, this.data, this.message});

  OngkosKirimResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <OngkosKirim>[];
      json['data'].forEach((v) {
        data!.add(new OngkosKirim.fromJson(v));
      });
    }
    message = json['message'];
  }

}

class OngkosKirim {
  String? nama;
  int? harga;
  String? estimasi;

  OngkosKirim({this.nama, this.harga, this.estimasi});

  OngkosKirim.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    harga = json['harga'];
    estimasi = json['estimasi'];
  }

}