import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:kharisma_sales_app/controllers/api/apps/notification_controller.dart';
import 'package:kharisma_sales_app/controllers/api/carts/cart_controller.dart';
import 'package:kharisma_sales_app/controllers/api/products/category_controller.dart';
import 'package:kharisma_sales_app/controllers/api/products/product_controller.dart';
import 'package:kharisma_sales_app/controllers/components/main_header_controller.dart';
import 'package:kharisma_sales_app/controllers/components/sidebar_category_controller.dart';
import 'package:kharisma_sales_app/services/global_data.dart';
import 'package:kharisma_sales_app/widgets/notification_dialog.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:get/get.dart';

class MainHeader extends StatelessWidget {
  final bool iconBookmark;
  final bool iconCart;
  final bool iconNotification;
  var countNotif = 0.obs;
  MainHeader({
    Key? key,
    required this.iconBookmark,
    required this.iconCart,
    required this.iconNotification,
  }) : super(key: key ?? UniqueKey());
  final MainHeaderController mainheaderController = Get.put(MainHeaderController());
  final NotificationController notificationController = Get.put(NotificationController());
  final ProductController productController = Get.put(ProductController());
  final SidebarCategoryController sidebarCategoryController = Get.put(SidebarCategoryController());
  final CategoryController categoryController = Get.put(CategoryController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    // print(GlobalData.hasToken);
    // print(countNewNotification);
    print('ini data' + GlobalData.hasToken.value.toString());
    return GetBuilder<MainHeaderController>(
      builder: (controller) {
        print('ini data' + GlobalData.hasToken.value.toString());
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
                controller: productController.searchEditController,
                autofocus: false,
                onSubmitted: (val) {},
                onChanged: (val) async {
                  if(Get.currentRoute != RoutesName.home){
                    await productController.fetchProductByFilter(
                      productController.searchEditController.text, 
                      sidebarCategoryController.variantHarga.value, 
                      categoryController.selectedValue.value
                      ).then((value) => Get.offAllNamed(RoutesName.home));
                    }else{
                      await productController.fetchProductByFilter(
                      productController.searchEditController.text, 
                      sidebarCategoryController.variantHarga.value, 
                      categoryController.selectedValue.value
                      );
                    }
                  },
                 
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
                badgeContent: Text(
                  mainheaderController.wishlistCount.value.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
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
                badgeContent: Text(
                  mainheaderController.cartCount.value.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
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
              child: mainheaderController.notifCount.value != 0
                  ? badge.Badge(
                      badgeContent: Text(
                         mainheaderController.notifCount.value.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      badgeStyle: badge.BadgeStyle(
                        badgeColor: AppsColors.loginColorPrimary,
                        padding: const EdgeInsets.symmetric(horizontal: 4)),
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
            Obx((){
              return GestureDetector(
              onTap: () {
                controller.profleIcon();
                if(GlobalData.hasToken.value){
                  Get.toNamed(RoutesName.profile);
                }else{
                  Get.offAllNamed(RoutesName.loginCustomer)!;
                }
                
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
                    GlobalData.hasToken.value ? Icons.dehaze : Icons.login,
                    color: controller.isProfileSelected.value
                        ? AppsColors.loginColorPrimary
                        : Colors.grey,
                  )),
            );
            }),
          ],
        ),
      );
    });
  }
}
