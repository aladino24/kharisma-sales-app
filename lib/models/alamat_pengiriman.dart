class AlamatPengirimanResult {
  int code;
  List<AlamatPengiriman> data;
  String message;
  
  AlamatPengirimanResult({required this.code, required this.data, required this.message});

  factory AlamatPengirimanResult.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<AlamatPengiriman> data = dataList.map((i) => AlamatPengiriman.fromJson(i)).toList();
    return AlamatPengirimanResult(
      code: json['code'],
      data: data,
      message: json['message'],
    );
  }
}

class AlamatPengiriman {
   final int id;
  final String isAlamatToko;
  final String alamatUtama;
  final String userId;
  final String penerima;
  final String noTelepon;
  final String kotaId;
  final String kota;
  final String provinsiId;
  final String provinsi;
  final String kecamatanId;
  final String kecamatan;
  final String kelurahan;
  final String kodePos;
  final String alamat;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;
  final String createdBy;
  final String updatedBy;
  final String deletedBy;
  final String alamatLengkap;

  AlamatPengiriman({
      required this.id,
      required this.isAlamatToko,
      required this.alamatUtama,
      required this.userId,
      required this.penerima,
      required this.noTelepon,
      required this.kotaId,
      required this.kota,
      required this.provinsiId,
      required this.provinsi,
      required this.kecamatanId,
      required this.kecamatan,
      required this.kelurahan,
      required this.kodePos,
      required this.alamat,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt,
      required this.createdBy,
      required this.updatedBy,
      required this.deletedBy,
      required this.alamatLengkap});

  factory AlamatPengiriman.fromJson(Map<String, dynamic> json) {
    return AlamatPengiriman(
      id: json['id'],
      isAlamatToko: json['is_alamat_toko'] ?? '',
      alamatUtama: json['alamat_utama'] ?? '',
      userId: json['user_id'] ?? '',
      penerima: json['penerima'] ?? '',
      noTelepon: json['no_telepon'] ?? '',
      kotaId: json['kota_id'] ?? '',
      kota: json['kota'] ?? '',
      provinsiId: json['provinsi_id'] ?? '',
      provinsi: json['provinsi'] ?? '',
      kecamatanId: json['kecamatan_id'] ?? '',
      kecamatan: json['kecamatan'] ?? '',
      kelurahan: json['kelurahan'] ?? '',
      kodePos: json['kode_pos'] ?? '',
      alamat: json['alamat'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      deletedAt: json['deleted_at'] ?? '',
      createdBy: json['created_by'] ?? '',
      updatedBy: json['updated_by'] ?? '',
      deletedBy: json['deleted_by'] ?? '',
      alamatLengkap: json['alamat_lengkap'] ?? '',
    );
  }
}
