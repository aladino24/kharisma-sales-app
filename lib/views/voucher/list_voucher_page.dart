import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/vouchers/voucher_controller.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';
import 'package:kharisma_sales_app/widgets/search_voucher.dart';

class ListVoucherPage extends StatelessWidget {
  ListVoucherPage({super.key});

  final VoucherController voucherController = Get.put(VoucherController());

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
              physics: ScrollPhysics(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Voucher Saya',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 25),
                          Text(
                            'Tambah Voucher',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SearchVoucher(),
                    SizedBox(height: 20),
                    // Listtile Voucher
                    Obx(() => voucherController.isLoading.value ? Center(
                      child: CircularProgressIndicator(
                        color: AppsColors.loginColorPrimary,
                      ),
                    ) : voucherController.listVoucher.length == 0 ? Center(
                      child: Text("Belum ada voucher yang tersedia"),
                    ) : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: voucherController.listVoucher.length,
                      itemBuilder: (context, index){
                        final voucher = voucherController.listVoucher[index];
                        DateTime tanggalMulai = DateTime.parse(voucher.tanggalMulai);
                        DateTime tanggalSelesai = DateTime.parse(voucher.tanggalSelesai);
                        Duration durasi = tanggalSelesai.difference(tanggalMulai);
                        int selisihHari = durasi.inDays;
                        return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // container with image
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 5
                                ),
                                child: Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.local_offer,
                                      color: AppsColors.loginColorPrimary,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5,),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            voucher.title,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          // text button Gunakan
                                          TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Gunakan >',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: AppsColors
                                                    .loginColorPrimary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        voucher.keterangan,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                        SizedBox(height: 10),
                                      Row(
                                        children: [
                                          // Icons durasi waktu
                                          Icon(
                                            Icons.access_time,
                                            color: AppsColors.loginColorPrimary,
                                            size: 16,
                                          ),
                                          Text(
                                            'Berakhir dalam ${selisihHari} Hari',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppsColors.loginColorPrimary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                     }
                    ))
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
