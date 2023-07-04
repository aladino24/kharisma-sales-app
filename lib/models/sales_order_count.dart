class SalesOrderCountResult {
  int? code;
  SalesOrderCount? data;
  String? message;

  SalesOrderCountResult({this.code, this.data, this.message});

  SalesOrderCountResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new SalesOrderCount.fromJson(json['data']) : null;
    message = json['message'];
  }

}

class SalesOrderCount {
  String? draft;
  int? sale;
  int? done;
  int? cancel;

  SalesOrderCount({this.draft, this.sale, this.done, this.cancel});

  SalesOrderCount.fromJson(Map<String, dynamic> json) {
    draft = json['draft'];
    sale = json['sale'];
    done = json['done'];
    cancel = json['cancel'];
  }

}
