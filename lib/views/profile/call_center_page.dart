import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/profile/profile_controller.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';



class CallCenterPage extends StatelessWidget {
  CallCenterPage({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MainHeader(
              iconBookmark: false, 
              iconCart: false, 
              iconNotification: false
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      // image
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Image.asset(
                          "assets/images/callcenter.png",
                          width: 400,
                          height: 400,
                        ),
                      ),
                      Container(
                        child: Text(
                          "Hubungi Kami",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Selamat Datang di Kharisma \n Call Center \n",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18
                            ),
                            children: [
                              TextSpan(
                                text: "Sampaikan keluhan, kendala, dan masalahmu terkait pesananmu dan aplikasi kami disini. Kami dengan senang hati akan membantu Anda",
                                style: TextStyle(
                                  color: AppsColors.loginFontColorSecondary,
                                  fontSize: 14
                                )
                              )
                            ]
                          ),
                         
                        ),
                      ),
                      // text button whatasapp hubungi
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextButton(
                          onPressed: () async {
                              bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");
                              if (whatsapp) {
                                await FlutterLaunch.launchWhatsapp(
                                    phone: profileController.numberWhatsapp.value, message: "Hallo, Admin saya perlu bantuan");
                              }else{
                                Get.snackbar(
                                  "Error",
                                  "Whatsapp tidak terinstall",
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white
                                );
                              }
                              
                          },
                          child: Text(
                            "Hubungi Kami",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: AppsColors.loginColorPrimary,
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}