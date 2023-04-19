class KecamatanList {
  int? code;
  List<Kecamatan>? data;
  String? message;

  KecamatanList({this.code, this.data, this.message});

  KecamatanList.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Kecamatan>[];
      json['data'].forEach((v) {
        data!.add(new Kecamatan.fromJson(v));
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

class Kecamatan{
  String? subdistrictId;
  String? provinceId;
  String? province;
  String? cityId;
  String? city;
  String? type;
  String? subdistrictName;

  Kecamatan(
      {this.subdistrictId,
      this.provinceId,
      this.province,
      this.cityId,
      this.city,
      this.type,
      this.subdistrictName});

  Kecamatan.fromJson(Map<String, dynamic> json) {
    subdistrictId = json['subdistrict_id'];
    provinceId = json['province_id'];
    province = json['province'];
    cityId = json['city_id'];
    city = json['city'];
    type = json['type'];
    subdistrictName = json['subdistrict_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subdistrict_id'] = this.subdistrictId;
    data['province_id'] = this.provinceId;
    data['province'] = this.province;
    data['city_id'] = this.cityId;
    data['city'] = this.city;
    data['type'] = this.type;
    data['subdistrict_name'] = this.subdistrictName;
    return data;
  }
}
