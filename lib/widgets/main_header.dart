import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:kharisma_sales_app/controllers/api/apps/notification_controller.dart';
import 'package:kharisma_sales_app/controllers/components/main_header_controller.dart';
import 'package:kharisma_sales_app/widgets/notification_dialog.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:get/get.dart';

class MainHeader extends StatelessWidget {
  final bool iconBookmark;
  final bool iconCart;
  final bool iconNotification;
  MainHeader({
    Key? key,
    required this.iconBookmark,
    required this.iconCart,
    required this.iconNotification,
  }) : super(key: key ?? UniqueKey());
  final mainheaderController = Get.put(MainHeaderController());
  final NotificationController notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    int countNewNotification = notificationController.notificationList
        .where((element) => element.isNew == '1')
        .length;
    // print(countNewNotification);

    return GetBuilder<MainHeaderController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 0),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(0, 0),
                        blurRadius: 8)
                  ]),
              child: TextField(
                autofocus: false,
                onSubmitted: (val) {},
                onChanged: (val) {},
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none),
                  hintText: " Search...",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: CircleAvatar(
                      backgroundColor: AppsColors.loginColorPrimary,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                controller.selectBookmarkIcon();
                Get.toNamed(RoutesName.saveProduct);
              },
              child: badge.Badge(
                // badgeContent: const Text(
                //   "1",
                //   style: TextStyle(color: Colors.white),
                // ),
                badgeStyle: badge.BadgeStyle(
                    badgeColor: AppsColors.loginColorPrimary,
                    padding: const EdgeInsets.symmetric(horizontal: 4)),
                child: Icon(
                  Icons.bookmark_outline,
                  color: controller.isBookmarkIconSelected.value
                      ? AppsColors.loginColorPrimary
                      : Colors.grey,
                  size: 25,
                ),
              ),
            ),
            const SizedBox(width: 14),
            GestureDetector(
              onTap: () {
                controller.selectCartIcon();
                Get.toNamed(RoutesName.cartProduct);
              },
              child: badge.Badge(
                // badgeContent: const Text(
                //   "1",
                //   style: TextStyle(color: Colors.white),
                // ),
                badgeStyle: badge.BadgeStyle(
                    badgeColor: AppsColors.loginColorPrimary,
                    padding: const EdgeInsets.symmetric(horizontal: 4)),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: controller.isCartIconSelected.value
                      ? AppsColors.loginColorPrimary
                      : Colors.grey,
                  size: 25,
                ),
              ),
            ),
            const SizedBox(width: 14),
            GestureDetector(
              onTap: () {
                controller.selectNotificationIcon();
                // Get.toNamed(RoutesName.notificationProduct);
                // lazyput notification_controller
                Get.lazyPut(() => NotificationController());
                Get.dialog(
                  NotificationDialog(),
                );
              },
              child: countNewNotification != 0
                  ? badge.Badge(
                      badgeContent: Text(
                        countNewNotification.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      ),
                      badgeStyle: badge.BadgeStyle(
                        badgeColor: AppsColors.loginColorPrimary,
                        elevation: 0,
                      ),
                      child: Icon(
                        Icons.notifications_none_outlined,
                        color: controller.isNotificationIconSelected.value
                            ? AppsColors.loginColorPrimary
                            : Colors.grey,
                        size: 25,
                      ),
                    )
                  : Icon(
                      Icons.notifications_none_outlined,
                      color: controller.isNotificationIconSelected.value
                          ? AppsColors.loginColorPrimary
                          : Colors.grey,
                      size: 25,
                    ),
            ),
            const SizedBox(width: 14),
            GestureDetector(
              onTap: () {
                controller.profleIcon();
                Get.toNamed(RoutesName.profile);
              },
              child: badge.Badge(
                  // badgeContent: const Text(
                  //   "1",
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  badgeStyle: badge.BadgeStyle(
                      badgeColor: AppsColors.loginColorPrimary,
                      padding: const EdgeInsets.symmetric(horizontal: 4)),
                  child: Icon(
                    Icons.dehaze,
                    color: controller.isProfileSelected.value
                        ? AppsColors.loginColorPrimary
                        : Colors.grey,
                  )),
            ),
          ],
        ),
      );
    });
  }
}
