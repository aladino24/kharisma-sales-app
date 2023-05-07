import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';
import 'package:kharisma_sales_app/controllers/components/tabbar_controller.dart';

class ProfileCustomerPage extends StatelessWidget {
  ProfileCustomerPage({Key? key}) : super(key: key);

  final MyTabController tabController = Get.put(MyTabController());
  final LoginController loginController = Get.put(LoginController());
  final LoginController userController = Get.find();

  final RxBool isExpandedMenu = false.obs;
  final RxBool isExpandedLayanan = false.obs;

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
                            print(userModel.nama);
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
                                      ListTile(
                                        title: Text(
                                          'Voucher',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        leading: Icon(Icons.book_online),
                                        onTap: () =>
                                            Get.toNamed(RoutesName.listVoucher),
                                      ),
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
                                          onTap: () => Get.toNamed(
                                              RoutesName.callcenter)),
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
                      child: TabBar(
                        controller: tabController.tabController,
                        tabs: [
                          Tab(
                            text: "Diproses",
                          ),
                          Tab(
                            text: "Dikirim",
                          ),
                          Tab(
                            text: "Penilaian",
                          ),
                          Tab(
                            text: "Gagal",
                          ),
                        ],
                        isScrollable: false,
                        indicatorColor: AppsColors.loginColorPrimary,
                        labelColor: AppsColors.loginFontColorSecondary,
                        labelStyle: TextStyle(fontSize: 14),
                        labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      ),
                    ),

                    Container(
                      height: 200,
                      width: Get.width * 0.9,
                      child: TabBarView(
                        controller: tabController.tabController,
                        children: [
                          // konten tab starters
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: 2,
                              itemBuilder: (context, index) {
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
                                    trailing: Text(
                                      "Sedang Diproses",
                                      style: TextStyle(
                                          color: Colors.orange, fontSize: 10),
                                    ),
                                    title: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppsColors
                                                .imageProductBackground,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/images/product.png",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Alamat Pengiriman",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "x100",
                                                  style: TextStyle(
                                                      color: AppsColors
                                                          .loginColorPrimary,
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                  ),
                                );
                              }),
                          // konten tab main course
                          Center(
                            child: Text("Tunggu ya dikirim"),
                          ),
                          // konten tab desserts
                          Center(
                            child: Text("Rating"),
                          ),
                          Center(
                            child: Text("Failed"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
