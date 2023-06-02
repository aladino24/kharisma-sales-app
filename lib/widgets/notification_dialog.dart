import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/apps/notification_controller.dart';

class NotificationDialog extends StatelessWidget {
  NotificationDialog({
    super.key,
  });

  final NotificationController notificationController = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 200),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: AlertDialog(
        scrollable: true,
        insetPadding: EdgeInsets.zero,
        content: Container(
          width: 350.0,
          height: 300,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notification',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      child: Text(
                        'Mark All as Read',
                        style: TextStyle(
                            color: AppsColors.loginColorPrimary, fontSize: 10.0),
                      ),
                      onTap: (){
                        notificationController.markAllRead();
                      },
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                Obx(() {
                  if (notificationController.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: notificationController.notificationList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  // color with opacity
                                  color: notificationController.notificationList[index].isNew == '1' ? AppsColors.loginColorPrimary
                                      .withOpacity(0.2) : Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor:
                                              AppsColors.loginColorPrimary,
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
                                                notificationController.notificationList[index].notificationTitle!,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                notificationController.notificationList[index].notificationBody!,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: AppsColors
                                                        .loginFontColorSecondary),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              onTap: (){
                                notificationController.markOneRead(notificationController.notificationList[index].id.toString());
                              },
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                          ],
                        );
                      },
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
