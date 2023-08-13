import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/controllers/api/apps/notification_controller.dart';
import 'package:kharisma_sales_app/controllers/api/orders/salesoder_controller.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/widgets/build_tab_with_badge.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';
import 'package:kharisma_sales_app/controllers/components/tabbar_controller.dart';

class ProfileCustomerPage extends StatelessWidget {
  ProfileCustomerPage({Key? key}) : super(key: key);

  final MyTabController tabController = Get.put(MyTabController());
  final LoginController loginController = Get.put(LoginController());
  final SalesorderController salesorderController = Get.put(SalesorderController());
  final LoginController userController = Get.find();

  final RxBool isExpandedMenu = false.obs;
  final RxBool isExpandedLayanan = false.obs;

  Future<void> profileRefresh() async{
    await Future.delayed(Duration(seconds: 2));
    await loginController.fetchUser();
    await salesorderController.getSalesOrder(index: 0);
    await salesorderController.countDraft;
    await salesorderController.countDone;
    await salesorderController.countSale;
    await salesorderController.countCancel;
  }

   Future<void> getRefreshProses() async {
    await Future.delayed(Duration(seconds: 2));
    await salesorderController.getSalesOrder(index: 0);
  }

   Future<void> getRefreshKirim() async {
    await Future.delayed(Duration(seconds: 2));
    await salesorderController.getSalesOrder(index: 1);
  }

   Future<void> getRefreshNilai() async {
    await Future.delayed(Duration(seconds: 2));
    await salesorderController.getSalesOrder(index: 2);
  }

   Future<void> getRefreshCancel() async {
    await Future.delayed(Duration(seconds: 2));
    await salesorderController.getSalesOrder(index: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MainHeader(
              iconBookmark: false,
              iconCart: false,
              iconNotification: false,
            ),

            // profile
            Expanded(
              child: RefreshIndicator(
                onRefresh: profileRefresh,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: Get.width * 0.9,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 5,
                                offset: const Offset(0, 0),
                              )
                            ]),
                        child: Column(
                          children: [
                            // circle avatar
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey,
                                child: const Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Obx(() {
                              if (userController.isLoading.value) {
                                return CircularProgressIndicator();
                              }
                              final userModel = userController.userModelData.value;
                              // print(userModel.nama);
                              return Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      "${userModel.nama ?? 'Anonymous'}",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      "${userModel.email ?? ''}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppsColors.loginFontColorSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
              
                            // button edit profile
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: Get.width * 0.75,
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(RoutesName.editProfile,
                                      arguments: userController.getUserModel());
                                },
                                child: Text("Edit Profile"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppsColors.loginColorPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
              
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    ExpansionTile(
                                      iconColor: AppsColors.loginColorPrimary,
                                      onExpansionChanged: (value) =>
                                          isExpandedMenu.value = value,
                                      title: Obx(
                                        () => Text(
                                          'Menu',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: isExpandedMenu.value
                                                ? AppsColors.loginColorPrimary
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                      children: [
                                        GestureDetector(
                                          child: ListTile(
                                            title: Text(
                                              'Alamat Pengiriman',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            tileColor:
                                                AppsColors.loginColorPrimary,
                                            leading: Icon(Icons.location_on),
                                          ),
                                          onTap: () =>
                                              Get.toNamed(RoutesName.listAddress),
                                        ),
                                        // ListTile(
                                        //   title: Text(
                                        //     'Voucher',
                                        //     style: TextStyle(fontSize: 14),
                                        //   ),
                                        //   leading: Icon(Icons.book_online),
                                        //   onTap: () =>
                                        //       Get.toNamed(RoutesName.listVoucher),
                                        // ),
                                        ListTile(
                                          title: Text(
                                            'Wishlist',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          leading: Icon(Icons.favorite),
                                          onTap: () {
                                            Get.toNamed(RoutesName.saveProduct);
                                          },
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Notification',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          leading: Icon(Icons.notifications),
                                          onTap: (){
                                            Get.toNamed(RoutesName.notifikasiAll)!.then((value) {
                                              Get.lazyPut(() => NotificationController());
                                            });
                                          },
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Logout',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          leading: Icon(Icons.logout),
                                          onTap: () async {
                                            loginController.logout();
                                          },
                                        ),
                                      ],
                                    ),
                                    ExpansionTile(
                                      iconColor: AppsColors.loginColorPrimary,
                                      onExpansionChanged: (value) =>
                                          isExpandedLayanan.value = value,
                                      title: Obx(
                                        () => Text(
                                          'Layanan',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: isExpandedLayanan.value
                                                ? AppsColors.loginColorPrimary
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                      children: [
                                        ListTile(
                                          title: Text(
                                            'Kebijakan Privasi',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          tileColor: AppsColors.loginColorPrimary,
                                          leading: Icon(Icons.lock),
                                          onTap: () => Get.toNamed(RoutesName.kebijakanPrivasi),
                                        ),
                                        GestureDetector(
                                          child: ListTile(
                                            title: Text(
                                              'Syarat Ketentuan',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            leading: Icon(Icons.article),
                                          ),
                                          onTap: () => Get.toNamed(
                                              RoutesName.termCondition),
                                        ),
                                        GestureDetector(
                                            child: ListTile(
                                              title: Text(
                                                'Hubungi Kami',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              leading: Icon(Icons.call),
                                            ),
                                            onTap: (){
                                              Get.toNamed(
                                                RoutesName.callcenter);
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
              
                      // tab bar
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 5,
                                offset: const Offset(0, 0),
                              )
                            ]),
                        width: Get.width * 0.9,
                        child: Stack(
                          children: [
                                TabBar(
                              controller: tabController.tabController,
                              tabs: [
                                Obx(() => buildTabWithBadge("Diproses", salesorderController.countDraft.value)), 
                                Obx(() => buildTabWithBadge("Dikirim", salesorderController.countSale.value)), 
                                Obx(() => buildTabWithBadge("Penilaian", salesorderController.countDone.value)), 
                                Obx(() => buildTabWithBadge("Gagal", salesorderController.countCancel.value)), 
                              ],
                              isScrollable: false,
                              indicatorColor: AppsColors.loginColorPrimary,
                              labelColor: AppsColors.loginFontColorSecondary,
                              labelStyle: TextStyle(fontSize: 14),
                              labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
                              onTap: (index) {
                                salesorderController.clearValue();
                                //clear value
                                salesorderController.getSalesOrder(index: index);
                              },
                            ),
                          ],
                        ),
                      ),
              
                      Container(
                        height: 300,
                        width: Get.width * 0.9,
                        child: TabBarView(
                          controller: tabController.tabController,
                          children: [
                            // konten tab starters
                            Obx(
                              () => RefreshIndicator(
                                onRefresh: getRefreshProses,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      salesorderController.salesOrders.length,
                                  itemBuilder: (context, index) {
                                    var salesOrder = salesorderController.salesOrders[index];
                                    var updatedAt = DateTime.parse(salesOrder.updatedAt!); // Ubah string timestamp menjadi objek DateTime
                                    var formattedDate = DateFormat('dd MMM yyyy').format(updatedAt);
                                    return GestureDetector(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(vertical: 5),
                                        width: Get.width * 0.9,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.2),
                                              blurRadius: 5,
                                              offset: const Offset(0, 0),
                                            ),
                                          ],
                                        ),
                                        child: ListTile(
                                          trailing: Column(
                                            children: [
                                              Text(
                                              salesOrder.noInvoice!,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                              Text(
                                                "Sedang Diproses",
                                                style: TextStyle(
                                                  color: Colors.orange,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "${NumberFormat.currency(
                                                    locale: 'id_ID',
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0,
                                                  ).format(int.parse(salesOrder.totalHarga!))}",
                                                style: TextStyle(
                                                  color: AppsColors.loginColorPrimary,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                          title: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 70,
                                                height: 70,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: AppsColors
                                                      .imageProductBackground,
                                                ),
                                                child: Icon(
                                                  Icons.shopping_bag,
                                                  size: 40,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                            formattedDate,
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                        children: salesOrder
                                                            .salesOrderProduct!
                                                            .map((product) {
                                                          return Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                product.product!.productName!,
                                                                style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight.w700,
                                                                ),
                                                                overflow:
                                                                    TextOverflow.ellipsis,
                                                              ),
                                                              SizedBox(height: 1),
                                                              Text(
                                                                'Satuan : ${product.productUom!.label!}',
                                                                style: TextStyle(
                                                                  fontSize: 10,
                                                                ),
                                                              ),
                                                              Text(
                                                                "x${product.quantity}",
                                                                style: TextStyle(
                                                                  color: AppsColors
                                                                      .loginColorPrimary,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                              SizedBox(height: 3),
                                                            ],
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // subtitle: Text(
                                          //   formattedDate,
                                          //   style: TextStyle(
                                          //     fontSize: 10,
                                          //   ),
                                          // ),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                        ),
                                      ),
                                      onTap: (){
                                        Get.toNamed(RoutesName.salesOrderDetail, arguments: salesOrder);
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
              
                            // konten tab main course
                            Obx(
                              () => RefreshIndicator(
                                onRefresh: getRefreshKirim,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      salesorderController.salesOrders.length,
                                  itemBuilder: (context, index) {
                                    var salesOrder = salesorderController.salesOrders[index];
                                    var updatedAt = DateTime.parse(salesOrder.updatedAt!); // Ubah string timestamp menjadi objek DateTime
                                    var formattedDate = DateFormat('dd MMM yyyy').format(updatedAt);
                                    return Container(
                                      margin: EdgeInsets.symmetric(vertical: 10),
                                      width: Get.width * 0.9,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 5,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      child: ListTile(
                                        trailing: Column(
                                          children: [
                                            Text(
                                              salesOrder.noInvoice!,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                            Text(
                                              "Sedang Dikirim",
                                              style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 10,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${NumberFormat.currency(
                                                  locale: 'id_ID',
                                                  symbol: 'Rp ',
                                                  decimalDigits: 0,
                                                ).format(int.parse(salesOrder.totalHarga!))}",
                                              style: TextStyle(
                                                color: AppsColors.loginColorPrimary,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        title: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: AppsColors
                                                    .imageProductBackground,
                                              ),
                                              child: Icon(
                                                Icons.shopping_bag,
                                                size: 40,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: salesOrder.salesOrderProduct != null ? salesOrder
                                                      .salesOrderProduct!
                                                      .map((product) {
                                                    return Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        product.product != null && product.product!.productName != null ? Text(
                                                          product.product!
                                                              .productName!,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                        ) : Text(''),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          "x${product.quantity}",
                                                          style: TextStyle(
                                                            color: AppsColors
                                                                .loginColorPrimary,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }).toList() : [],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        subtitle: Text(
                                          formattedDate,
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                            onTap: (){
                                        Get.toNamed(RoutesName.salesOrderDetail, arguments: salesOrder);
                                      },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            // konten tab desserts
                            Obx(
                              () => RefreshIndicator(
                                onRefresh: getRefreshNilai,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      salesorderController.salesOrders.length,
                                  itemBuilder: (context, index) {
                                    var salesOrder = salesorderController.salesOrders[index];
                                    var updatedAt = DateTime.parse(salesOrder.updatedAt!); // Ubah string timestamp menjadi objek DateTime
                                    var formattedDate = DateFormat('dd MMM yyyy').format(updatedAt);
                                    return Container(
                                      margin: EdgeInsets.symmetric(vertical: 10),
                                      width: Get.width * 0.9,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 5,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      child: ListTile(
                                        trailing: Column(
                                          children: [
                                             Text(
                                              salesOrder.noInvoice!,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                            Text(
                                              "Selesai",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 10,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${NumberFormat.currency(
                                                  locale: 'id_ID',
                                                  symbol: 'Rp ',
                                                  decimalDigits: 0,
                                                ).format(int.parse(salesOrder.totalHarga!))}",
                                              style: TextStyle(
                                                color: AppsColors.loginColorPrimary,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        title: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: AppsColors
                                                    .imageProductBackground,
                                              ),
                                              child: Icon(
                                                Icons.shopping_bag,
                                                size: 40,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: salesOrder.salesOrderProduct != null ? salesOrder
                                                      .salesOrderProduct!
                                                      .map((product) {
                                                    return Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        product.product != null && product.product!.productName != null ? Text(
                                                          product.product!
                                                              .productName!,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                        ) : Text(''),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          "x${product.quantity}",
                                                          style: TextStyle(
                                                            color: AppsColors
                                                                .loginColorPrimary,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }).toList() : []
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        subtitle: Text(
                                          formattedDate,
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                            onTap: (){
                                        Get.toNamed(RoutesName.salesOrderDetail, arguments: salesOrder);
                                      },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Obx(
                              () => RefreshIndicator(
                                onRefresh: getRefreshCancel,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      salesorderController.salesOrders.length,
                                  itemBuilder: (context, index) {
                                    var salesOrder = salesorderController.salesOrders[index];
                                    var updatedAt = DateTime.parse(salesOrder.updatedAt!); // Ubah string timestamp menjadi objek DateTime
                                    var formattedDate = DateFormat('dd MMM yyyy').format(updatedAt);
                                    return Container(
                                      margin: EdgeInsets.symmetric(vertical: 10),
                                      width: Get.width * 0.9,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 5,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      child: ListTile(
                                        trailing: Column(
                                          children: [
                                             Text(
                                              salesOrder.noInvoice == null ? salesOrder.noInvoice! : '',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                            Text(
                                              "Pesanan Gagal",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 10,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${NumberFormat.currency(
                                                  locale: 'id_ID',
                                                  symbol: 'Rp ',
                                                  decimalDigits: 0,
                                                ).format(int.parse(salesOrder.totalHarga!))}",
                                              style: TextStyle(
                                                color: AppsColors.loginColorPrimary,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        title: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: AppsColors
                                                    .imageProductBackground,
                                              ),
                                              child: Icon(
                                                Icons.shopping_bag,
                                                size: 40,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: salesOrder.salesOrderProduct!
                                                      .map((product) {
                                                    return Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          product.product!.productName!,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          "x${product.quantity}",
                                                          style: TextStyle(
                                                            color: AppsColors
                                                                .loginColorPrimary,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        subtitle: Text(
                                          formattedDate,
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                          onTap: (){
                                        Get.toNamed(RoutesName.salesOrderDetail, arguments: salesOrder);
                                      },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
