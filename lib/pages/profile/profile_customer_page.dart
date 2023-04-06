import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/utils/apps_colors.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';
import 'package:kharisma_sales_app/controllers/components/tabbar_controller.dart';

class ProfileCustomerPage extends StatelessWidget {
  ProfileCustomerPage({Key? key}) : super(key: key);

  final MyTabController tabController = Get.put(MyTabController());

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
                      height: 380,
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
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Text(
                                  "Admin",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  "admin@gmail.com",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppsColors.loginFontColorSecondary),
                                )
                              ],
                            ),
                          ),
              
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
                                  ListTile(
                                    title: Text(
                                      'Menu',
                                      style: TextStyle(fontWeight: FontWeight.w700),
                                    ),
                                    tileColor: Colors.red,
                                    trailing: Icon(Icons.arrow_forward_ios),
                                  ),
                                  ListTile(
                                    title: Text(
                                      'Layanan',
                                      style: TextStyle(fontWeight: FontWeight.w700),
                                    ),
                                    tileColor: Colors.red,
                                    trailing: Icon(Icons.arrow_forward_ios),
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
