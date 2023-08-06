import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/address/alamat_kirim_controller.dart';
import 'package:kharisma_sales_app/controllers/api/address/ongkos_kirim_controller.dart';
import 'package:kharisma_sales_app/controllers/api/orders/salesoder_controller.dart';
import 'package:kharisma_sales_app/controllers/api/products/product_controller.dart';
import 'package:kharisma_sales_app/models/buy_now.dart';
import 'package:kharisma_sales_app/models/ongkos_kirim.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';

// ignore: must_be_immutable
class CheckoutProductPage extends StatelessWidget {
  CheckoutProductPage({super.key});

  final TextEditingController claimController = TextEditingController();

  final OngkosKirimController ongkosKirimController =
      Get.put(OngkosKirimController());

  final AlamatKirimController alamatKirimController =
      Get.put(AlamatKirimController());

  final ProductController productController = Get.find<ProductController>();
  final SalesorderController salesOrderController =
      Get.put(SalesorderController());

  RxInt biayaPengiriman = 0.obs;
  RxString estimasi = 'Not Available'.obs;
  RxString nama = ''.obs;
  //
  RxInt subTotal = 0.obs;
  RxInt total = 0.obs;

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    // final productId = arguments['productId'];
    // final productTmplid = arguments['productTmplid'];
    final productName = arguments['productName'];

    // final price = arguments['price'];
    final quantity = arguments['quantity'];
    final satuan = arguments['satuan'];
    final imageProduct = arguments['imageProduct'];
    final weight = arguments['weight'];

    // int priceProduct = int.parse(price);
    // int quantityProduct = quantity;

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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 95,
                                    height: 95,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppsColors.imageProductBackground,
                                      image: DecorationImage(
                                        image: imageProduct != null
                                            ? Image.network(
                                                imageProduct,
                                                fit: BoxFit.cover,
                                              ).image
                                            : AssetImage(
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // DiskonProduct(),
                                        SizedBox(height: 2),
                                        // satuan
                                        Text(
                                          "Satuan : ${satuan}",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Obx(
                                          () => Text(
                                            NumberFormat.currency(
                                              locale: 'id_ID',
                                              symbol: 'Rp ',
                                              decimalDigits: 0,
                                            ).format(int.parse(productController.price.value.toString())),
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
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
                                return Container(
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppsColors.loginColorPrimary, // Replace this with your desired border color
                                    width: 1.0,
                                  ),
                                  ),
                                  child: InputDecorator(
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 5.0),
                                        errorStyle: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 16.0),
                                        hintText: 'Pilih jenis pengiriman',
                                        border:  InputBorder.none ),
                                    isEmpty: false,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: DropdownButtonHideUnderline(
                                          child: Obx(() {
                                        if (ongkosKirimController
                                            .listOngkosKirim.isEmpty) {
                                          ongkosKirimController.fetchOngkosKirim(
                                              alamatKirimController
                                                  .alamatPengiriman
                                                  .value
                                                  .kecamatanId,
                                              weight);
                                        }
                                        return DropdownButtonFormField(
                                          hint: ongkosKirimController
                                                  .isLoading.value
                                              ? Text("Loading...")
                                              : Text('Pilih jenis pengiriman'),
                                          // value: 'COD',
                                          isDense: true,
                                          items: ongkosKirimController
                                                  .listOngkosKirim.isNotEmpty
                                              ? List.generate(
                                                  ongkosKirimController
                                                      .listOngkosKirim.length,
                                                  (index) => DropdownMenuItem(
                                                        child: Text(
                                                          ongkosKirimController
                                                              .listOngkosKirim[
                                                                  index]
                                                              .nama!,
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                        value:
                                                            ongkosKirimController
                                                                .listOngkosKirim[
                                                                    index]
                                                                .nama,
                                                      ))
                                              : null,
                                          onChanged: (value) {
                                            String selectedValue = value
                                                as String; // Ubah tipe value ke String
                                            OngkosKirim selectedOngkosKirim =
                                                ongkosKirimController
                                                    .listOngkosKirim
                                                    .firstWhere(
                                                        (element) =>
                                                            element.nama ==
                                                            selectedValue,
                                                        orElse: () =>
                                                            OngkosKirim()); // Menggunakan properti 'nama' sebagai nilai yang dicocokkan
                                            ongkosKirimController
                                                .selectedOngkosKirim
                                                .value = selectedOngkosKirim;
                                            biayaPengiriman.value =
                                                selectedOngkosKirim.harga ?? 0;
                                            estimasi.value =
                                                selectedOngkosKirim.estimasi!;
                                            nama.value =
                                                selectedOngkosKirim.nama!;
                                          },
                                          value: ongkosKirimController
                                                  .selectedOngkosKirim
                                                  .value
                                                  ?.nama ??
                                              null,
                                          decoration: InputDecoration(
                                            border: InputBorder
                                                .none, // Menghilangkan underline
                                          ),
                                        );
                                      })),
                                    ),
                                  ),
                                );
                              },
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
                            Text(
                              "Estimasi Tiba",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Obx(
                              () => Row(
                                children: [
                                  Icon(Icons.calendar_month),
                                  estimasi.value == ''
                                      ? Text('Not Available')
                                      : Text(estimasi.value)
                                ],
                              ),
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
                                            // DiskonProduct()
                                          ],
                                        ),
                                        Obx(() {
                                          return Text(
                                            NumberFormat.currency(
                                                    locale: 'id',
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0)
                                                .format(productController
                                                    .totalPrice.value),
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          );
                                        })
                                      ],
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(10.0),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       Row(
                                  //         children: [
                                  //           Text(
                                  //             "Total Diskon",
                                  //             style:
                                  //                 TextStyle(color: Colors.red),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       Text(
                                  //         "Rp 0",
                                  //         style: TextStyle(color: Colors.red),
                                  //       )
                                  //     ],
                                  //   ),
                                  // ),
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
                                          total.value = productController
                                                  .totalPrice.value +
                                              biayaPengiriman.value;
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
                            Obx(() {
                              if (productController.buyNowResponse.value.data !=
                                      null &&
                                  productController
                                      .buyNowResponse.value.data!.isNotEmpty) {
                                BuyNow data = productController
                                    .buyNowResponse.value.data![0];
                                return Container(
                                  width: Get.width,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              AppsColors.loginColorPrimary),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                    onPressed: salesOrderController
                                            .isLoading.value
                                        ? null
                                        : () async {
                                            if (nama.value == '') {
                                              Get.snackbar(
                                                'Gagal',
                                                'Pilih Jenis Pengiriman Terlebih Dahulu',
                                                backgroundColor: Colors.red,
                                                colorText: Colors.white,
                                              );
                                            } else {
                                              if (!salesOrderController.isLoading.value) {
                                                showDialog(
                                                  context: context, 
                                                  builder: (BuildContext context){
                                                    return AlertDialog(
                                                      title: Text("Konfirmasi"),
                                                      content: Text("Apakah yakin ingin melanjutkan?"),
                                                      actions: [
                                                        TextButton(
                                                          child: Text(
                                                            "Cancel",
                                                            style: TextStyle(
                                                                color: AppsColors.loginColorPrimary),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(context).pop();
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: Text("Confirm",
                                                          style: TextStyle(
                                                            color: AppsColors.loginColorPrimary)
                                                         ), 
                                                         onPressed: ()async{
                                                          Navigator.of(context).pop();
                                                          salesOrderController.isLoading.value = true;
                                                          var status = await salesOrderController
                                                                  .salesOrderStore(
                                                            productController.dataUuid.value,
                                                            data.product!.weight,
                                                            biayaPengiriman.toString(),
                                                            nama.value,
                                                          );
                                                          salesOrderController
                                                              .isLoading.value = false;

                                                          if (status == '200') {
                                                            Get.offNamed(RoutesName.orderSuccess);
                                                          } else {
                                                            Get.snackbar(
                                                              "Failed",
                                                              "Your order has failed",
                                                              backgroundColor: Colors.red,
                                                              colorText: Colors.white,
                                                            );
                                                          }
                                                         },
                                                        )
                                                      ],
                                                    );
                                                  }
                                                );
                                              }
                                            }
                                          },
                                    child: Obx(() => salesOrderController
                                            .isLoading.value
                                        ? Center(
                                            child: CircularProgressIndicator())
                                        : Text(
                                            "Buat Sales Order",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                  ),
                                );
                              } else {
                                return CircularProgressIndicator();
                              }
                            }),
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
