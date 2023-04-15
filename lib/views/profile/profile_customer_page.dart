import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';
import 'package:kharisma_sales_app/controllers/components/tabbar_controller.dart';
import 'package:kharisma_sales_app/models/user_model.dart';

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
                          FutureBuilder<UserModel?>(
                              future: userController.getUserModel(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }
                                final userModel = snapshot.data;
                                return Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${userModel?.nama ?? 'Anonymous'}",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        "${userModel?.email ?? ''}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppsColors
                                                .loginFontColorSecondary),
                                      )
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
                              onPressed: () {},
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
                                    onExpansionChanged: (value) => isExpandedMenu.value = value,
                                    title: Obx(
                                      () => Text(
                                        'Menu',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: isExpandedMenu.value
                                              ? AppsColors
                                                  .loginColorPrimary 
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
                                          tileColor: AppsColors.loginColorPrimary,
                                          leading: Icon(Icons.location_on),
                                        ),
                                        onTap: () => Get.toNamed(RoutesName.addAddress),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Voucher',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        leading: Icon(Icons.book_online),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Wishlist',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        leading: Icon(Icons.favorite),
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
                                    onExpansionChanged: (value) => isExpandedLayanan.value = value,
                                    title: Obx(
                                      () => Text(
                                        'Layanan',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: isExpandedLayanan.value
                                              ? AppsColors
                                                  .loginColorPrimary 
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
                                        onTap: () => Get.toNamed(RoutesName.termCondition),
                                      ),
                                      GestureDetector(
                                        child: ListTile(
                                          title: Text(
                                            'Hubungi Kami',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          leading: Icon(Icons.call),
                                        ),
                                        onTap: () => Get.toNamed(RoutesName.callcenter)
                                      ),
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
                      height: 20, // set tinggi container sesuai kebutuhan
                      child: TabBarView(
                        controller: tabController.tabController,
                        children: [
                          // konten tab starters
                          Center(
                            child: Text("Lagi Diproses sabar"),
                          ),
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
