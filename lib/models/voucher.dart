class VoucherResult {
  int? code;
  List<Voucher>? data;
  String? message;

  VoucherResult({this.code, this.data, this.message});

  VoucherResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Voucher>[];
      json['data'].forEach((v) {
        data!.add(new Voucher.fromJson(v));
      });
    }
    message = json['message'];
  }


}

class Voucher {
  int? id;
  int? userId;
  String? tipe;
  String? kodeVoucher;
  String? maksimalPenggunaan;
  String? title;
  String? keterangan;
  String? tanggalMulai;
  String? tanggalSelesai;
  String? persenPresentasePotongan;
  String? persenMinimalPembelian;
  String? persenMaksimalPotongan;
  String? status;
  String? isClaim;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? createdBy;
  String? updatedBy;
  String? deletedBy;
  String? deskripsiBonus;
  String? userDesc;
  String? user;

  Voucher(
      {this.id,
      this.userId,
      this.tipe,
      this.kodeVoucher,
      this.maksimalPenggunaan,
      this.title,
      this.keterangan,
      this.tanggalMulai,
      this.tanggalSelesai,
      this.persenPresentasePotongan,
      this.persenMinimalPembelian,
      this.persenMaksimalPotongan,
      this.status,
      this.isClaim,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.createdBy,
      this.updatedBy,
      this.deletedBy,
      this.deskripsiBonus,
      this.userDesc,
      this.user});

  Voucher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    tipe = json['tipe'];
    kodeVoucher = json['kode_voucher'];
    maksimalPenggunaan = json['maksimal_penggunaan'];
    title = json['title'];
    keterangan = json['keterangan'];
    tanggalMulai = json['tanggal_mulai'];
    tanggalSelesai = json['tanggal_selesai'];
    persenPresentasePotongan = json['persen_presentase_potongan'];
    persenMinimalPembelian = json['persen_minimal_pembelian'];
    persenMaksimalPotongan = json['persen_maksimal_potongan'];
    status = json['status'];
    isClaim = json['is_claim'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedBy = json['deleted_by'];
    deskripsiBonus = json['deskripsi_bonus'];
    userDesc = json['user_desc'];
    user = json['user'];
  }
}
