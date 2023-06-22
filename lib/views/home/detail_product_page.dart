import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/carts/cart_controller.dart';
import 'package:kharisma_sales_app/controllers/api/products/product_controller.dart';
import 'package:kharisma_sales_app/models/product.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/widgets/diskon_product.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';
import 'package:kharisma_sales_app/widgets/rating_star.dart';
import 'package:kharisma_sales_app/controllers/components/detail_product_controller.dart';

class DetailProductPage extends StatelessWidget {
  DetailProductPage({super.key});

  CarouselController? carouselController = CarouselController();
  final DetailProductController detailProductController =
      Get.put(DetailProductController());
  final ProductController productController = Get.find<ProductController>();
  final Product? product = Get.arguments as Product?;
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
    // get arguments json

    // print(product!.productName);
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
                                    image: product!.gdImagePath != null
                                        ? Image.network(
                                            product!.gdImagePath!,
                                            fit: BoxFit.cover,
                                          ).image
                                        : Image.asset(
                                            'assets/images/image.png',
                                            fit: BoxFit.cover,
                                          ).image,
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
                            width: 280,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    product!.productName.toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
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
                                  product!.pricelist != null &&
                                          product!.pricelist!.length >= 2
                                      ? product!.pricelist![1].type == 'b2b'
                                          ? "Seller Price : ${NumberFormat.currency(
                                              locale: 'id_ID',
                                              symbol: 'Rp ',
                                              decimalDigits: 0,
                                            ).format(int.parse(product!.pricelist![1].price.toString()))}"
                                          : product!.pricelist![1].type == 'b2c'
                                              ? "Customer Price : ${NumberFormat.currency(
                                                  locale: 'id_ID',
                                                  symbol: 'Rp ',
                                                  decimalDigits: 0,
                                                ).format(int.parse(product!.pricelist![1].price.toString()))}"
                                              : ""
                                      : "",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    color: AppsColors.loginFontColorPrimaryDark,
                                  ),
                                ),
                                Text(
                                  product!.pricelist != null &&
                                          product!.pricelist![0].type == 'b2b'
                                      ? "Seller Price : ${NumberFormat.currency(
                                          locale: 'id_ID',
                                          symbol: 'Rp ',
                                          decimalDigits: 0,
                                        ).format(int.parse(product!.pricelist![0].price.toString()))}"
                                      : product!.pricelist != null &&
                                              product!.pricelist![0].type ==
                                                  'b2c'
                                          ? "Customer Price : ${NumberFormat.currency(
                                              locale: 'id_ID',
                                              symbol: 'Rp ',
                                              decimalDigits: 0,
                                            ).format(int.parse(product!.pricelist![0].price.toString()))}"
                                          : "",
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
                          GetBuilder<DetailProductController>(
                            builder: (controller) => Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "Quantity",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color:
                                          AppsColors.loginFontColorPrimaryDark,
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
                                              border: Border.all(
                                                  color: Colors.grey),
                                            ),
                                            child: Center(
                                              child: GestureDetector(
                                                child: Icon(Icons.remove),
                                                onTap: () {
                                                  detailProductController
                                                      .decrement();
                                                },
                                              ),
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
                                                  "${detailProductController.quantity.value}",
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
                                              border: Border.all(
                                                  color: Colors.grey),
                                            ),
                                            child: Center(
                                              child: GestureDetector(
                                                child: Icon(Icons.add),
                                                onTap: () {
                                                  detailProductController
                                                      .increment(
                                                          detailProductController
                                                              .quantity.value,
                                                          product!.stock);
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "( Stock : ${product!.stock} )",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                      color:
                                          AppsColors.loginFontColorPrimaryDark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Keranjang dan Beli Sekarang
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                GestureDetector(
                                  child: Container(
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
                                  onTap: () {
                                    // lazyput cartcontroller
                                    Get.lazyPut(() => CartController());
                                    final cartController =
                                        Get.find<CartController>();
                                    cartController.addCartProduct(
                                        product!.productId!,
                                        product!.pricelist![0].price!,
                                        detailProductController.quantity.value);
                                  },
                                ),
                                GestureDetector(
                                    child: Container(
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
                                    onTap: () {
                                      Get.toNamed(RoutesName.checkoutProduct,
                                          arguments: {
                                            "productId": product!.productId,
                                            "productTmplid":
                                                product!.productTmplId,
                                            "productName": product!.productName,
                                            "price": product!.pricelist!
                                                .where((element) =>
                                                    element.type == 'b2b')
                                                .first
                                                .price,
                                            "quantity": detailProductController
                                                .quantity.value,
                                            'imageProduct':
                                                product!.gdImagePath,
                                            'weight': product!.weight,
                                          });
                                      productController.checkPrice(
                                          product!.productTmplId,
                                          detailProductController
                                              .quantity.value);
                                    }),
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
                          Obx(
                            () => Container(
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
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          width: 90,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: detailProductController
                                                        .variant.value ==
                                                    'Hitam'
                                                ? AppsColors.loginColorPrimary
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: detailProductController
                                                            .variant.value ==
                                                        'Hitam'
                                                    ? AppsColors
                                                        .loginColorPrimary
                                                    : AppsColors
                                                        .loginFontColorSecondary),
                                          ),
                                          child: InkWell(
                                            child: Center(
                                                child: Text(
                                              "Hitam",
                                              style: TextStyle(
                                                  color: detailProductController
                                                              .variant.value ==
                                                          'Hitam'
                                                      ? Colors.white
                                                      : AppsColors
                                                          .loginFontColorSecondary),
                                            )),
                                            onTap: () => detailProductController
                                                .setVariant('Hitam'),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          width: 90,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: detailProductController
                                                        .variant.value ==
                                                    'Merah'
                                                ? AppsColors.loginColorPrimary
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: detailProductController
                                                            .variant.value ==
                                                        'Merah'
                                                    ? AppsColors
                                                        .loginColorPrimary
                                                    : AppsColors
                                                        .loginFontColorSecondary),
                                          ),
                                          child: InkWell(
                                            child: Center(
                                                child: Text(
                                              "Merah",
                                              style: TextStyle(
                                                  color: detailProductController
                                                              .variant.value ==
                                                          'Merah'
                                                      ? Colors.white
                                                      : AppsColors
                                                          .loginFontColorSecondary),
                                            )),
                                            onTap: () => detailProductController
                                                .setVariant('Merah'),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          width: 90,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: detailProductController
                                                        .variant.value ==
                                                    'Putih'
                                                ? AppsColors.loginColorPrimary
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: detailProductController
                                                            .variant.value ==
                                                        'Putih'
                                                    ? AppsColors
                                                        .loginColorPrimary
                                                    : AppsColors
                                                        .loginFontColorSecondary),
                                          ),
                                          child: InkWell(
                                            child: Center(
                                                child: Text(
                                              "Putih",
                                              style: TextStyle(
                                                  color: detailProductController
                                                              .variant.value ==
                                                          'Putih'
                                                      ? Colors.white
                                                      : AppsColors
                                                          .loginFontColorSecondary),
                                            )),
                                            onTap: () => detailProductController
                                                .setVariant('Putih'),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
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
                                ),
                              ],
                            ),
                          ),
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
