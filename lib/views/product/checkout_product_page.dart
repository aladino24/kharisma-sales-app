import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/address/alamat_kirim_controller.dart';
import 'package:kharisma_sales_app/controllers/api/address/ongkos_kirim_controller.dart';
import 'package:kharisma_sales_app/models/ongkos_kirim.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/widgets/diskon_product.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';

class CheckoutProductPage extends StatelessWidget {
  CheckoutProductPage({super.key});

  final TextEditingController claimController = TextEditingController();

  final OngkosKirimController ongkosKirimController =
      Get.put(OngkosKirimController());

  final AlamatKirimController alamatKirimController =
      Get.put(AlamatKirimController());


  // obs variabel biayaPengiriman
  RxInt biayaPengiriman = 0.obs;
  RxInt subTotal = 0.obs;
  RxInt total = 0.obs;

  
  
  @override
  Widget build(BuildContext context) {
     final arguments = Get.arguments;
      final productId = arguments['productId'];
      final productName = arguments['productName'];
      final price = arguments['price'];
      final quantity = arguments['quantity'];
      final imageProduct = arguments['imageProduct'];
      final weight = arguments['weight'];
      

      int priceProduct = int.parse(price);
      int quantityProduct = quantity;
      
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
                            "Checkout",
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
                                            style: 
                                            ElevatedButton.styleFrom(
                                              backgroundColor: AppsColors.loginColorPrimary
                                            ),
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
                                            text: alamatKirimController.alamatPengiriman.value.penerima,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                text: alamatKirimController.alamatPengiriman.value.isAlamatToko == "1" ? " ( Alamat Toko )" : "",
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
                                          text: alamatKirimController.alamatPengiriman.value.noTelepon,
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
                        height: 110,
                        child: Scrollbar(
                          child: Container(
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
                                        width: 95,
                                        height: 95,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color:AppsColors.imageProductBackground,
                                          image: DecorationImage(
                                            image: imageProduct != null ? Image.memory(
                                              base64Decode(imageProduct),
                                              fit: BoxFit.cover,
                                            ).image : AssetImage(
                                                'assets/images/image.png',
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
                                            Container(
                                              width: 220,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      productName,
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            DiskonProduct(),
                                            SizedBox(
                                              height: 5,
                                            ),
                                             Text(
                                                NumberFormat.currency(
                                                  locale: 'id_ID',
                                                  symbol: 'Rp ',
                                                  decimalDigits: 0,
                                                ).format(int.parse(
                                                    price!)),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Qty : ${quantity}x",
                                              style: TextStyle(
                                                fontSize: 12,
                                                
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                            FormField<String>(
                              builder: (FormFieldState<String> state) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      errorStyle: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 16.0),
                                      hintText: 'Pilih jenis pengiriman',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  isEmpty: false,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: DropdownButtonHideUnderline(
                                        child: Obx(() {
                                            if (ongkosKirimController.listOngkosKirim.isEmpty) {
                                                ongkosKirimController.fetchOngkosKirim(alamatKirimController.alamatPengiriman.value.kecamatanId, weight);
                                              }
                                          return DropdownButtonFormField(
                                            hint: ongkosKirimController
                                                    .isLoading.value
                                                ? Text("Loading...")
                                                : Text('Pilih jenis pengiriman'),
                                            // value: 'COD',
                                            isDense: true,
                                            items: ongkosKirimController.listOngkosKirim.isNotEmpty
                                                ? List.generate(
                                                    ongkosKirimController
                                                        .listOngkosKirim.length,
                                                    (index) => DropdownMenuItem(
                                                          child: Text(
                                                            ongkosKirimController.listOngkosKirim[index].nama!,
                                                            style: TextStyle(
                                                                fontSize: 12),
                                                          ),
                                                          value: ongkosKirimController.listOngkosKirim[index],
                                                        ))
                                                : null,
                                            onChanged: (value) {
                                              OngkosKirim selectedOngkosKirim = value as OngkosKirim;
                                              // print(selectedOngkosKirim.nama);
                                              // subTotal
                                              biayaPengiriman.value = selectedOngkosKirim.harga ?? 0;
                                              // print(biayaPengiriman.value);
                                            },
                                            value: ongkosKirimController.selectedOngkosKirim.value != null
                                                ? ongkosKirimController.selectedOngkosKirim.value
                                                : null,
                                            decoration: InputDecoration(
                                              border: InputBorder.none, // Menghilangkan underline
                                            ),
                                          );
                                        } 
                                    )),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Voucher",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // SearchVoucher(),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Estimasi Tiba",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.calendar_month),
                                Text("27 Februari 2023")
                              ],
                            ),
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
                                            DiskonProduct()
                                          ],
                                        ),
                                        Obx((){
                                          subTotal.value = priceProduct * quantityProduct;
                                          return Text(
                                            NumberFormat.currency(
                                                    locale: 'id',
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0)
                                                .format(subTotal.value),
                                            style: TextStyle(
                                                fontSize: 16,
                                               ),
                                          );
                                        })
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
                                          "Rp 100.000",
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
                                        Obx(() {
                                          return Text(
                                            NumberFormat.currency(
                                                    locale: 'id',
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0)
                                                .format(biayaPengiriman.value),
                                            style: TextStyle(
                                                fontSize: 16,
                                               ),
                                          );
                                        })
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
                                        Obx(() {
                                          total.value = subTotal.value + biayaPengiriman.value;
                                          return Text(
                                            NumberFormat.currency(
                                                    locale: 'id',
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0)
                                                .format(total.value),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          );
                                        })
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
                            Container(
                              width: Get.width,
                              child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            AppsColors.loginColorPrimary),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    )),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Lanjutkan",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
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
