import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/apps/notification_controller.dart';
import 'package:kharisma_sales_app/controllers/components/main_header_controller.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotifikasiAllPage extends StatefulWidget {
  NotifikasiAllPage({super.key});

  @override
  State<NotifikasiAllPage> createState() => _NotifikasiAllPageState();
}

class _NotifikasiAllPageState extends State<NotifikasiAllPage> {
  final NotificationController notificationController =
      Get.find<NotificationController>();

  final MainHeaderController mainHeaderController =
      Get.find<MainHeaderController>();

  @override
  void initState() {
    timeago.setLocaleMessages('id', timeago.IdMessages());
    super.initState();
  }

  Future<void> getRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    notificationController.fetchNotificationFull();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          MainHeader(
              iconBookmark: false, iconCart: false, iconNotification: false),
          // Listview
          Expanded(
            child: Obx(() {
              if (notificationController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppsColors.loginColorPrimary,
                  ),
                );
              } else {
                return RefreshIndicator(
                  onRefresh: getRefresh,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: notificationController.notificationList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 5,
                                    offset: Offset(0, 2))
                              ]),
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: notificationController
                                                .notificationList[index].isNew ==
                                            '1'
                                        ? AppsColors.loginColorPrimary
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                                // icon
                                child: Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      notificationController
                                          .notificationList[index]
                                          .notificationTitle!,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      notificationController
                                          .notificationList[index]
                                          .notificationBody!,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      notificationController.notificationList[index].customDatetime!,
                                      style: TextStyle(
                                          fontSize: 12, color: AppsColors.loginColorPrimary),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          notificationController
                              .markOneRead(notificationController
                                  .notificationList[index].id
                                  .toString())
                              .then((value) =>
                                  mainHeaderController.getNotifCount());
                        },
                      );
                    },
                  ),
                );
              }
            }),
          )
        ],
      )),
    );
  }
}


