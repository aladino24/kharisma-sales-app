import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/address/alamat_kirim_controller.dart';
import 'package:kharisma_sales_app/controllers/api/address/ongkos_kirim_controller.dart';
import 'package:kharisma_sales_app/controllers/api/orders/salesoder_controller.dart';
import 'package:kharisma_sales_app/controllers/api/products/product_controller.dart';
import 'package:kharisma_sales_app/models/sales_order.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';

// ignore: must_be_immutable
class DetailSalesorderPage extends StatelessWidget {
  DetailSalesorderPage({super.key});

  final TextEditingController claimController = TextEditingController();

  final OngkosKirimController ongkosKirimController = Get.put(OngkosKirimController());

  final AlamatKirimController alamatKirimController = Get.put(AlamatKirimController());

  final ProductController productController = Get.find<ProductController>();
  final SalesorderController salesOrderController = Get.put(SalesorderController());

  RxInt biayaPengiriman = 0.obs;
  RxString estimasi = 'Not Available'.obs;
  RxString nama = ''.obs;
  //
  RxInt subTotal = 0.obs;
  RxInt total = 0.obs;
   int weight = 0;

  @override
  Widget build(BuildContext context) {
    // cek apakah ada arguments yang dikirim
    final SalesOrder arguments = Get.arguments;
    // tampilkan arguments
    // print(arguments.jasaPengiriman);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          MainHeader(
              iconBookmark: false, iconCart: false, iconNotification: false),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Detail Order",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Alamat Pengiriman",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            thickness: 2,
                          )
                        ],
                      )),
                      SizedBox(height: 10),
                      Obx(
                        () {
                          if (alamatKirimController.listAlamat.length == 0) {
                            return alamatKirimController.isLoading.value
                                ? Center(child: CircularProgressIndicator())
                                : Container(
                                    child: Column(
                                      children: [
                                        Text(
                                            "Anda belum memiliki alamat pengiriman"),
                                        SizedBox(height: 10),
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.toNamed(RoutesName.addAddress);
                                          },
                                          child:
                                              Text("Tambah Alamat Pengiriman"),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppsColors.loginColorPrimary),
                                        )
                                      ],
                                    ),
                                  );
                          } else {
                            return Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: AppsColors.loginColorPrimary,
                                      ),
                                      SizedBox(width: 5),
                                      Text.rich(
                                        TextSpan(
                                            text: alamatKirimController
                                                .alamatPengiriman
                                                .value
                                                .penerima,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                text: alamatKirimController
                                                            .alamatPengiriman
                                                            .value
                                                            .isAlamatToko ==
                                                        "1"
                                                    ? " ( Alamat Toko )"
                                                    : "",
                                              )
                                            ]),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppsColors.labelAlamatUtama,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 2),
                                          child: Text(
                                            "Utama",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: AppsColors.loginColorPrimary,
                                      ),
                                      SizedBox(width: 5),
                                      Text.rich(
                                        TextSpan(
                                          text: alamatKirimController
                                              .alamatPengiriman.value.noTelepon,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: AppsColors.loginColorPrimary,
                                      ),
                                      SizedBox(width: 5),
                                      Container(
                                        width: 300,
                                        child: Text.rich(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          TextSpan(
                                            text:
                                                "${alamatKirimController.alamatPengiriman.value.alamat}, ${alamatKirimController.alamatPengiriman.value.kecamatan}, ${alamatKirimController.alamatPengiriman.value.kota}, ${alamatKirimController.alamatPengiriman.value.provinsi} (${alamatKirimController.alamatPengiriman.value.kodePos})",
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          }
                        },
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 150,
                        child: Scrollbar(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: arguments.salesOrderProduct!.length,
                            itemBuilder: (context, index) {
                              // Get the cart product at the current index
                              SalesOrderProduct productList = arguments.salesOrderProduct![index];
                              weight += int.parse(productList.product!.weight!);
                              return Container(
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
                                  title: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color:
                                              AppsColors.imageProductBackground,
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/product.png",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              productList.product!.productName
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              NumberFormat.currency(
                                                locale: 'id_ID',
                                                symbol: 'Rp ',
                                                decimalDigits: 0,
                                              ).format(int.parse(productList
                                                  .harga
                                                  .toString())),
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            // DiskonProduct(),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Qty: ${productList.quantity.toString()}",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jenis Pengiriman",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              enabled: false, // Menjadikan nilai readonly
                              initialValue: arguments.jasaPengiriman, // Menampilkan nilai dari arguments.jasaPengiriman
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                hintText: 'Pilih jenis pengiriman',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            // Text(
                            //   "Voucher",
                            //   style: TextStyle(
                            //       fontSize: 18, fontWeight: FontWeight.bold),
                            // ),
                            SizedBox(
                              height: 10,
                            ),
                            // SearchVoucher(),
                            SizedBox(
                              height: 20,
                            ),
                            // Calculation
                            Container(
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
                                  border: Border.all(
                                    color: AppsColors.loginFontColorSecondary,
                                  )),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0, top: 15),
                                    child: Text(
                                      "Ringkasan Belanja",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Divider(
                                      thickness: 2,
                                    ),
                                  ),
                                  // Sub total
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Sub Total"),
                                            SizedBox(width: 5),
                                            // DiskonProduct()
                                          ],
                                        ),
                                       Text(
                                            NumberFormat.currency(
                                                    locale: 'id',
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0)
                                                .format(int.parse(arguments.totalHargaProduk!)),
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Total Diskon",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Rp 0",
                                          style: TextStyle(color: Colors.red),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Biaya Pengiriman"),
                                        Text(
                                            NumberFormat.currency(
                                                    locale: 'id',
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0)
                                                .format(int.parse(arguments.ongkosKirim!)),
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0,
                                        left: 8.0,
                                        right: 8.0,
                                        bottom: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                            NumberFormat.currency(
                                                    locale: 'id',
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0)
                                                .format(int.parse(arguments.totalHarga!)),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // Button
                            // Obx(() {
                            //   if (productController.buyNowResponse.value.data !=
                            //           null &&
                            //       productController
                            //           .buyNowResponse.value.data!.isNotEmpty) {
                            //     BuyNow data = productController
                            //         .buyNowResponse.value.data![0];
                            //     return Container(
                            //       width: Get.width,
                            //       child: TextButton(
                            //         style: ButtonStyle(
                            //           backgroundColor:
                            //               MaterialStateProperty.all<Color>(
                            //                   AppsColors.loginColorPrimary),
                            //           shape: MaterialStateProperty.all<
                            //               RoundedRectangleBorder>(
                            //             RoundedRectangleBorder(
                            //               borderRadius:
                            //                   BorderRadius.circular(10.0),
                            //             ),
                            //           ),
                            //         ),
                            //         onPressed: salesOrderController
                            //                 .isLoading.value
                            //             ? null
                            //             : () async {
                            //                 if (nama.value == '') {
                            //                   Get.snackbar(
                            //                     'Error',
                            //                     'Pilih Jenis Pengiriman Terlebih Dahulu',
                            //                     backgroundColor: Colors.red,
                            //                     colorText: Colors.white,
                            //                   );
                            //                 } else {
                            //                   if (!salesOrderController
                            //                       .isLoading.value) {
                            //                     salesOrderController
                            //                         .isLoading.value = true;
                            //                     var status =
                            //                         await salesOrderController
                            //                             .salesOrderStore(
                            //                       productController
                            //                           .dataUuid.value,
                            //                       data.product!.weight,
                            //                       biayaPengiriman.toString(),
                            //                       nama.value,
                            //                     );
                            //                     salesOrderController
                            //                         .isLoading.value = false;

                            //                     if (status == '200') {
                            //                       Get.offNamed(RoutesName.orderSuccess);
                            //                     } else {
                            //                       Get.snackbar(
                            //                         "Failed",
                            //                         "Your order has failed",
                            //                         backgroundColor: Colors.red,
                            //                         colorText: Colors.white,
                            //                       );
                            //                     }
                            //                   }
                            //                 }
                            //               },
                            //         child: Obx(() => salesOrderController
                            //                 .isLoading.value
                            //             ? Center(
                            //                 child: CircularProgressIndicator())
                            //             : Text(
                            //                 "Lanjutkan",
                            //                 style: TextStyle(
                            //                   color: Colors.white,
                            //                   fontWeight: FontWeight.bold,
                            //                 ),
                            //               )),
                            //       ),
                            //     );
                            //   } else {
                            //     return CircularProgressIndicator();
                            //   }
                            // }),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}