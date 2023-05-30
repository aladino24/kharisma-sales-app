class NotificationResult {
  int? code;
  List<NotificationItem>? data;
  String? message;

  NotificationResult({this.code, this.data, this.message});

  NotificationResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <NotificationItem>[];
      json['data'].forEach((v) {
        data!.add(new NotificationItem.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class NotificationItem {
  int? id;
  String? notificationType;
  String? isNew;
  String? judul;
  String? pengumuman;
  String? notificationTitle;
  String? notificationBody;

  NotificationItem(
      {this.id,
      this.notificationType,
      this.isNew,
      this.judul,
      this.pengumuman,
      this.notificationTitle,
      this.notificationBody});

  NotificationItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationType = json['notification_type'];
    isNew = json['is_new'];
    judul = json['judul'];
    pengumuman = json['pengumuman'];
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
  }

}
