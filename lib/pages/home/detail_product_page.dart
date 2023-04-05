import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/utils/apps_colors.dart';
import 'package:kharisma_sales_app/widgets/diskon_product.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';
import 'package:kharisma_sales_app/widgets/rating_star.dart';

class DetailProductPage extends StatelessWidget {
  DetailProductPage({super.key});

  CarouselController? carouselController = CarouselController();

  void previousImage() {
    carouselController!.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void nextImage() {
    carouselController!
        .nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          MainHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      height: Get.height / 3,
                      width: Get.width,
                      child: Stack(
                        children: [
                          CarouselSlider(
                            items: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppsColors.imageProductBackground,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/product2.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppsColors.imageProductBackground,
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/product.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/product2.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/product.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                            options: CarouselOptions(
                              height: 360,
                              viewportFraction: 1,
                              aspectRatio: 2,
                              autoPlay: false,
                              enlargeCenterPage: true,
                              reverse: false,
                            ),
                            carouselController: carouselController,
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            bottom: 0,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: previousImage,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward_ios),
                              onPressed: nextImage,
                            ),
                          ),
                        ],
                      )),
                  Container(
                    width: 500,
                    height: 100,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100.0,
                          height: 100.0,
                          child: Center(
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: AppsColors.imageProductBackground,
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Bolpoin G-Soft",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                DiskonProduct()
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: RatingStar(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Seller Price : Rp 3.000",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    color: AppsColors.loginFontColorPrimaryDark,
                                  ),
                                ),
                                Text(
                                  "Customer Price : Rp 3.500",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    color: AppsColors.textCustomerPrice,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Quantity product
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Quantity",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    color: AppsColors.loginFontColorPrimaryDark,
                                  ),
                                ),
                                //table disini
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: Center(
                                            child: Icon(Icons.add),
                                          ),
                                        ),
                                        Container(
                                          width: 40,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "15",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: Center(
                                            child: Icon(Icons.remove),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  "( Stock : 100 )",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    color: AppsColors.loginFontColorPrimaryDark,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Keranjang dan Beli Sekarang
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: 150,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppsColors.loginColorPrimary),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "+ Add To Cart",
                                      style: TextStyle(
                                          color: AppsColors.loginColorPrimary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: AppsColors.loginColorPrimary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Buy Now",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Garis batas description
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Divider(
                              color: AppsColors.loginFontColorSecondary,
                              thickness: 2,
                            ),
                          ),

                          // Varian product
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Varian (4)",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(right: 5),
                                        width: 90,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: AppsColors.loginColorPrimary,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color:
                                                  AppsColors.loginColorPrimary),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "Hitam",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(right: 5),
                                        width: 90,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: AppsColors
                                                  .loginFontColorSecondary),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "Merah",
                                          style: TextStyle(
                                              color: AppsColors
                                                  .loginFontColorSecondary),
                                        )),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(right: 5),
                                        width: 90,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: AppsColors
                                                  .loginFontColorSecondary),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "Putih",
                                          style: TextStyle(
                                              color: AppsColors
                                                  .loginFontColorSecondary),
                                        )),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          // Detail Product description
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Detail Product",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '• Oil Gel\n'
                                  '• Terasa halus saat digunakan\n'
                                  '• Tinta cepat kering dan anti air\n'
                                  '• Tidak mudah rembes/tembus\n\n'
                                  'Harap cek ketersediaan barang terlebih dahulu',
                                  style: TextStyle(
                                      fontSize: 16,
                                      height: 1.5,
                                      color:
                                          AppsColors.loginFontColorSecondary),
                                  textAlign: TextAlign.justify,
                                  textDirection: TextDirection.ltr,
                                ),
                              ],
                            ),
                          ),

                          // Informasi Order
                          Container(
                            margin: const EdgeInsets.only(top: 20),
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
                                    "Informasi Order",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: Divider(
                                    color: AppsColors.loginFontColorSecondary,
                                    thickness: 2,
                                  ),
                                ),

                                // Alamat Pengiriman
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Dikirim Ke",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.location_on,
                                                        color: AppsColors
                                                            .loginColorPrimary,
                                                      ),
                                                      Text(
                                                        "Jl. Ahmad Yani No. 37, Suraba... ",
                                                        style: TextStyle(
                                                            color: AppsColors
                                                                .loginColorPrimary),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // icon edit
                                                Icon(
                                                  Icons.edit,
                                                  color: AppsColors
                                                      .loginFontColorSecondary,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Ongkir
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Ongkir",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.fire_truck_rounded,
                                                  color: AppsColors
                                                      .loginColorPrimary,
                                                ),
                                                Text(
                                                  " Reguler 15.000",
                                                  style: TextStyle(
                                                      color: AppsColors
                                                          .loginColorPrimary),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Estimasi Sampai
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Estimasi Tiba",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_month_rounded,
                                                  color: AppsColors
                                                      .loginColorPrimary,
                                                ),
                                                Text(
                                                  " 07-10 April 2023",
                                                  style: TextStyle(
                                                      color: AppsColors
                                                          .loginColorPrimary),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text("Sub Total"),
                                                SizedBox(width: 5),
                                                DiskonProduct()
                                              ],
                                            ),
                                            Text("Rp 300.000")
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Biaya Pengiriman"),
                                            Text("Rp 15.000")
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 30),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total", 
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16
                                              ),
                                            ),
                                            Text(
                                              "Rp 315.000",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16
                                              )
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )

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
          ),
        ],
      )),
    );
  }
}

