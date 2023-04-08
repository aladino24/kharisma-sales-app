import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:kharisma_sales_app/controllers/components/main_header_controller.dart';
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

  @override
  Widget build(BuildContext context) {
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Notification',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Mark All as Read',
                                      style: TextStyle(
                                          color: AppsColors.loginColorPrimary,
                                          fontSize: 10.0),
                                    )
                                  ],
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    // color with opacity
                                    color: AppsColors.loginColorPrimary
                                        .withOpacity(0.2),
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
                                              children: [
                                                Text(
                                                  'Terimakasih sudah melakukan pembayaran transaksi INV-2023/2403000024 sejumlah 54.300',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Text(
                                                  'Tunggu sebentar, pembayaranmu sedang kami proses..',
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
                                Divider(
                                  color: Colors.grey,
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  // decoration: BoxDecoration(
                                  //   // color with opacity
                                  //   color: AppsColors.loginColorPrimary.withOpacity(0.2),
                                  // ),
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
                                              children: [
                                                Text(
                                                  'Terimakasih sudah melakukan pembayaran transaksi INV-2023/2403000024 sejumlah 54.300',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Text(
                                                  'Tunggu sebentar, pembayaranmu sedang kami proses..',
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: badge.Badge(
                  badgeContent: const Text(
                    "1",
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
                  )),
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
