import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/carts/cart_controller.dart';
import 'package:kharisma_sales_app/models/cart_product.dart';
import 'package:kharisma_sales_app/widgets/diskon_product.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';
import 'package:kharisma_sales_app/widgets/tabel_quantity.dart';

class CartProductPage extends StatelessWidget {
  CartProductPage({Key? key}) : super(key: key);

  final CartController cartController = Get.put(CartController());

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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      height: 50,
                      child: Row(children: [
                        // pilih semua action
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                    const Text("Pilih Semua"),
                                  ],
                                ),
                                Text("Action")
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                    // Cart product
                    SizedBox(
                      height: 300,
                      child: Obx(() => ListView.builder(
                        shrinkWrap: true,
                        itemCount: cartController.cartProductList.length,
                        itemBuilder: (context, index) {
                             CartProduct cartProduct = cartController.cartProductList[index];
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
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
                            child: CheckboxListTile(
                              value: false,
                              onChanged: (value) {},
                              title: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 90,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppsColors.imageProductBackground,
                                      image: DecorationImage(
                                        image: cartProduct.product!.image != null ? 
                                        MemoryImage(base64Decode(cartProduct.product!.image!)) : AssetImage(
                                          'assets/images/image.png',
                                        ) as ImageProvider,
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
                                          width: 120,
                                          child: Text(
                                            cartProduct.product!.productName!,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2, 
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
                                                  ).format(int.parse(cartProduct.price!)),
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TableQuantity(size: 20, iconSize: 12)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              secondary: Icon(Icons.delete),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                          );
                        },
                      ),)
                    ),

                    // Informasi Order
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: AppsColors.loginFontColorSecondary,
                            width: 1.2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Ringkasan Belanja",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Divider(
                              color: AppsColors.loginFontColorSecondary,
                              thickness: 2,
                            ),
                          ),

                          // Calculation
                          Container(
                            child: Column(
                              children: [
                                // Sub total
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Sub Total"),
                                      Text("Rp 300.000")
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
                                      Text("Rp 15.000")
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
                                      Text("Rp 315.000",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // // Button
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text("Beli Sekarang"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppsColors.loginColorPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
