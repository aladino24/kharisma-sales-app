class AlamatPengirimanResult {
  int? code;
  List<AlamatPengiriman>? data;
  String? message;

  AlamatPengirimanResult({this.code, this.data, this.message});

  AlamatPengirimanResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <AlamatPengiriman>[];
      json['data'].forEach((v) {
        data!.add(new AlamatPengiriman.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class AlamatPengiriman {
  int? id;
  String? isAlamatToko;
  String? alamatUtama;
  String? userId;
  String? penerima;
  String? noTelepon;
  String? kotaId;
  String? kota;
  String? provinsiId;
  String? provinsi;
  String? kecamatanId;
  String? kecamatan;
  String? kelurahan;
  String? kodePos;
  String? alamat;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? createdBy;
  String? updatedBy;
  Null? deletedBy;
  String? alamatLengkap;

  AlamatPengiriman(
      {this.id,
      this.isAlamatToko,
      this.alamatUtama,
      this.userId,
      this.penerima,
      this.noTelepon,
      this.kotaId,
      this.kota,
      this.provinsiId,
      this.provinsi,
      this.kecamatanId,
      this.kecamatan,
      this.kelurahan,
      this.kodePos,
      this.alamat,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.createdBy,
      this.updatedBy,
      this.deletedBy,
      this.alamatLengkap});

  AlamatPengiriman.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isAlamatToko = json['is_alamat_toko'];
    alamatUtama = json['alamat_utama'];
    userId = json['user_id'];
    penerima = json['penerima'];
    noTelepon = json['no_telepon'];
    kotaId = json['kota_id'];
    kota = json['kota'];
    provinsiId = json['provinsi_id'];
    provinsi = json['provinsi'];
    kecamatanId = json['kecamatan_id'];
    kecamatan = json['kecamatan'];
    kelurahan = json['kelurahan'];
    kodePos = json['kode_pos'];
    alamat = json['alamat'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedBy = json['deleted_by'];
    alamatLengkap = json['alamat_lengkap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_alamat_toko'] = this.isAlamatToko;
    data['alamat_utama'] = this.alamatUtama;
    data['user_id'] = this.userId;
    data['penerima'] = this.penerima;
    data['no_telepon'] = this.noTelepon;
    data['kota_id'] = this.kotaId;
    data['kota'] = this.kota;
    data['provinsi_id'] = this.provinsiId;
    data['provinsi'] = this.provinsi;
    data['kecamatan_id'] = this.kecamatanId;
    data['kecamatan'] = this.kecamatan;
    data['kelurahan'] = this.kelurahan;
    data['kode_pos'] = this.kodePos;
    data['alamat'] = this.alamat;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['deleted_by'] = this.deletedBy;
    data['alamat_lengkap'] = this.alamatLengkap;
    return data;
  }
}
