class UserModel {
  int? id;
  String? type;
  String? email;
  String? nama;
  String? telepon;
  String? alamat;
  String? nama_toko;
  String? alamat_toko;
  String? kelurahan;
  String? kecamatan;
  String? kota;
  String? provinsi;
  String? zip;
  String? lat;
  String? lng;
  String? email_verified_at;
  String? created_at;
  String? updated_at;
  String? deleted_at;
  String? created_by;
  String? updated_by;
  String? deleted_by;

  UserModel({
    this.id,
    this.type,
    this.email,
    this.nama,
    this.telepon,
    this.alamat,
    this.nama_toko,
    this.alamat_toko,
    this.kelurahan,
    this.kecamatan,
    this.kota,
    this.provinsi,
    this.zip,
    this.lat,
    this.lng,
    this.email_verified_at,
    this.created_at,
    this.updated_at,
    this.deleted_at,
    this.created_by,
    this.updated_by,
    this.deleted_by,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    email = json['email'];
    nama = json['nama'];
    telepon = json['telepon'];
    alamat = json['alamat'];
    nama_toko = json['nama_toko'];
    alamat_toko = json['alamat_toko'];
    kelurahan = json['kelurahan'];
    kecamatan = json['kecamatan'];
    kota = json['kota'];
    provinsi = json['provinsi'];
    zip = json['zip'];
    lat = json['lat'];
    lng = json['lng'];
    email_verified_at = json['email_verified_at'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
    created_by = json['created_by'];
    updated_by = json['updated_by'];
    deleted_by = json['deleted_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['email'] = this.email;
    data['nama'] = this.nama;
    data['telepon'] = this.telepon;
    data['alamat'] = this.alamat;
    data['nama_toko'] = this.nama_toko;
    data['alamat_toko'] = this.alamat_toko;
    data['kelurahan'] = this.kelurahan;
    data['kecamatan'] = this.kecamatan;
    data['kota'] = this.kota;
    data['provinsi'] = this.provinsi;
    data['zip'] = this.zip;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['email_verified_at'] = this.email_verified_at;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
    data['deleted_at'] = this.deleted_at;
    data['created_by'] = this.created_by;
    data['updated_by'] = this.updated_by;
    data['deleted_by'] = this.deleted_by;
    return data;
  }
}
