import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/address/alamat_kirim_controller.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';

class ListAddressPage extends StatelessWidget {
  ListAddressPage({super.key});

  final AlamatKirimController listAlamatPengiriman =
      Get.put(AlamatKirimController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          MainHeader(
              iconBookmark: false, iconCart: false, iconNotification: false),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Alamat Pengiriman Saya",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          Text(
                            "Kelola Informasi Alamat Pengiriman",
                            style: TextStyle(
                                color: AppsColors.loginFontColorSecondary),
                          ),
                          SizedBox(height: 10),
                          Divider(thickness: 2)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: GestureDetector(
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: AppsColors.loginColorPrimary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Tambah Alamat Baru",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        onTap: () => Get.toNamed(RoutesName.addAddress),
                      ),
                    ),
                    Obx(
                      () => listAlamatPengiriman.isLoading.value
                          ? Center(child: CircularProgressIndicator())
                          : listAlamatPengiriman.errorMessage.isNotEmpty
                              ? Center(
                                  child: Text(
                                      listAlamatPengiriman.errorMessage.value))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      listAlamatPengiriman.listAlamat.length,
                                  itemBuilder: (context, index) {
                                    final data =
                                        listAlamatPengiriman.listAlamat[index];
                                    String name = data.penerima;
                                    // print(listAlamatPengiriman.listAlamat.length);
                                    String displayName = name.length > 12
                                        ? name.substring(0, 10) + "..."
                                        : name;
                                    return Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
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
                                        trailing: Icon(
                                          Icons.edit,
                                          size: 16,
                                          color: AppsColors.loginColorPrimary,
                                        ),
                                        title: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 90,
                                              height: 90,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: AppsColors
                                                    .imageAlamatBackground,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    "assets/images/map.png",
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text.rich(
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          TextSpan(
                                                            text: displayName,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                text: "|",
                                                                style: TextStyle(
                                                                    color: AppsColors
                                                                        .loginFontColorSecondary,
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    " ${data.noTelepon}",
                                                                style: TextStyle(
                                                                    color: AppsColors
                                                                        .loginFontColorSecondary,
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text.rich(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 3,
                                                      TextSpan(
                                                        text:
                                                            "${data.alamat} , ${data.kelurahan}, ${data.kelurahan}, ${data.kecamatan}, ${data.kota}, ${data.provinsi}",
                                                        style: TextStyle(
                                                            color: AppsColors
                                                                .loginFontColorSecondary,
                                                            fontSize: 10),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      // label alamat utama
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5,
                                                              vertical: 2),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color: AppsColors
                                                                  .loginColorPrimary,
                                                              width: 1)),
                                                      child: Text(
                                                        "Alamat Utama",
                                                        style: TextStyle(
                                                            color: AppsColors
                                                                .loginColorPrimary,
                                                            fontSize: 10),
                                                      ),
                                                    )
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
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
