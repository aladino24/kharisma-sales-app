import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/api/carts/cart_controller.dart';
import 'package:kharisma_sales_app/controllers/api/products/category_controller.dart';
import 'package:kharisma_sales_app/controllers/api/products/product_controller.dart';
import 'package:kharisma_sales_app/controllers/api/products/save_product_controller.dart';
import 'package:kharisma_sales_app/controllers/components/main_header_controller.dart';
import 'package:kharisma_sales_app/controllers/components/network/controllers/network_controller.dart';
import 'package:kharisma_sales_app/controllers/components/sidebar_category_controller.dart';
import 'package:kharisma_sales_app/models/category.dart';
import 'package:kharisma_sales_app/models/product.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/views/home/sidebar_filter_page.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';
import 'package:kharisma_sales_app/widgets/rating_star.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final MainHeaderController myController = Get.put(MainHeaderController());
  final CategoryController categoryController = Get.put(CategoryController());
  final ProductController productController = Get.put(ProductController());
  final SidebarCategoryController sidebarCategoryController = Get.put(SidebarCategoryController());
  //cart controller
  final CartController cartController = Get.put(CartController());
  final NetworkController networkController = Get.find<NetworkController>();
  var customer_price;
  var sales_price;
   String? categoryProduct;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Obx(() {
        if (networkController.connectionStatus.value == 0) {
          return Center(
            // tampilkan gambar no connection
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/error_connection.jpg',
                  width: 300,
                  height: 300,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Koneksi Anda Terputus :(",
                      style: TextStyle(fontSize: 16.25, color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 7),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Periksa koneksi internet atau Wi-Fi Anda dan coba lagi",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  myController.selectAllIcon();
                  return MainHeader(
                    iconBookmark: myController.isBookmarkIconSelected.value,
                    iconCart: myController.isCartIconSelected.value,
                    iconNotification:
                        myController.isNotificationIconSelected.value,
                    key: UniqueKey(),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  // width * 0.5
                  height: 60,
                  padding: const EdgeInsets.only(
                      left: 15, right: 20, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        "Sort By : ",
                        style: TextStyle(
                          color: AppsColors.loginFontColorSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                )
                              ],
                            ),
                            child: Obx(() {
                                  final categoryList = categoryController.categoryList;
                                  final selectedValue = categoryController.selectedValue.value;
                                  if (categoryList.isEmpty) {
                                    return DropdownButton<String>(
                                      value: 'Loading...',
                                      icon:
                                          Icon(Icons.keyboard_arrow_down_outlined),
                                      iconSize: 24,
                                      elevation: 16,
                                      underline: Container(),
                                      style: TextStyle(
                                        color: AppsColors.loginFontColorSecondary,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      onChanged:
                                          null, // Disable dropdown when loading
                                      items: [
                                        DropdownMenuItem<String>(
                                          value: 'Loading...',
                                          child: Text(
                                            'Loading...',
                                            style: TextStyle(
                                              color: AppsColors
                                                  .loginFontColorSecondary,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }

                                  return DropdownButton<String>(
                                    isExpanded: true,
                                    value: selectedValue.isEmpty ? 'All Category' : selectedValue,
                                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                                    iconSize: 24,
                                    elevation: 16,
                                    underline: Container(),
                                    style: TextStyle(
                                      color: AppsColors.loginFontColorSecondary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    onChanged: (newValue) async {
                                     
                                      if (newValue!.isNotEmpty) {
                                        categoryProduct = newValue;
                                      }

                                      if (newValue == 'All Category') {
                                        categoryProduct = '';
                                      }
                                      categoryController.onDropdownValueChanged(newValue);
                                      await productController.fetchProductByFilter(productController.searchEditController.text, sidebarCategoryController.variantHarga.value, categoryProduct);
                                      
                                    },
                                    items: [
                                      DropdownMenuItem<String>(
                                        value: 'All Category',
                                        child: Text(
                                          'All Category',
                                          style: TextStyle(
                                            color:
                                                AppsColors.loginFontColorSecondary,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      ...categoryList.map<DropdownMenuItem<String>>(
                                        (Category category) {
                                          return DropdownMenuItem<String>(
                                            value: category.productTagId,
                                            child: Text(
                                              category.name!,
                                              style: TextStyle(
                                                color: AppsColors.loginFontColorSecondary,
                                                fontSize: 12,
                                              ),
                                            ),
                                          );
                                        },
                                      ).toList(),
                                    ],
                                  );
                                }),),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      // icon button with text filter
                      Builder(builder: (context){
                        return InkWell(
                        onTap: (){
                            Scaffold.of(context).openEndDrawer();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 5,
                                offset: const Offset(0, 0),
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.filter_alt_outlined,
                                color: AppsColors.loginFontColorSecondary,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Filter",
                                style: TextStyle(
                                  color: AppsColors.loginFontColorSecondary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                      })
                    ],
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    if (productController.isLoading.value) {
                      return GridView.builder(
                        padding: const EdgeInsets.all(5),
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.53,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          padding: const EdgeInsets.all(5),
                          itemCount: productController.products.length,
                          itemBuilder: (context, index) {
                            Product product = productController.products[index];

                            //  print('Ini image ' + product.image!);
                            return Container(
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
                                  GestureDetector(
                                    child: Container(
                                      // heigh sesuai dengan tinggi parent * 0.5
                                      height: 165,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color:
                                              AppsColors.imageProductBackground,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15.0),
                                            topRight: Radius.circular(15.0),
                                          )),
                                      child: product.gdImagePath != null
                                          ? Image.network(
                                              product.gdImagePath!,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              'assets/images/image.png',
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                    onTap: () {
                                      Get.toNamed(RoutesName.detailProduct,
                                          arguments: product);
                                    },
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product.productName.toString(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppsColors
                                                      .loginFontColorPrimaryDark),
                                            ),
                                            Text(
                                              product.pricelist != null &&
                                                      product.pricelist!.length >= 2
                                                  ? product.pricelist![1]
                                                              .type == 'b2b'
                                                      ? "Seller Price : ${NumberFormat.currency(
                                                          locale: 'id_ID',
                                                          symbol: 'Rp ',
                                                          decimalDigits: 0,
                                                        ).format(int.parse(product.pricelist![1].price.toString()))}"
                                                      : product.pricelist![1]
                                                                  .type ==
                                                              'b2c'
                                                          ? "Customer Price : ${NumberFormat.currency(
                                                              locale: 'id_ID',
                                                              symbol: 'Rp ',
                                                              decimalDigits: 0,
                                                            ).format(int.parse(product.pricelist![1].price.toString()))}"
                                                          : ""
                                                  : "",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: AppsColors
                                                      .loginFontColorPrimaryDark),
                                            ),
                                            Text(
                                              product.pricelist != null &&
                                                      product.pricelist![0]
                                                              .type ==
                                                          'b2b'
                                                  ? "Seller Price : ${NumberFormat.currency(
                                                      locale: 'id_ID',
                                                      symbol: 'Rp ',
                                                      decimalDigits: 0,
                                                    ).format(int.parse(product.pricelist![0].price.toString()))}"
                                                  : product.pricelist != null &&
                                                          product.pricelist![0]
                                                                  .type ==
                                                              'b2c'
                                                      ? "Customer Price : ${NumberFormat.currency(
                                                          locale: 'id_ID',
                                                          symbol: 'Rp ',
                                                          decimalDigits: 0,
                                                        ).format(int.parse(product.pricelist![0].price.toString()))}"
                                                      : "",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        Get.toNamed(RoutesName.detailProduct,
                                            arguments: product);
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RatingStar(),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 28,
                                                height: 28,
                                                decoration: BoxDecoration(
                                                    color: AppsColors
                                                        .imageProductBackground,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(100),
                                                    )),
                                                child: GestureDetector(
                                                  child: Icon(Icons.favorite,
                                                      color: Colors.red,
                                                      size: 18),
                                                  onTap: () {
                                                    // lazy put
                                                    Get.lazyPut(() =>
                                                        SaveProductController());
                                                    final saveProductController =
                                                        Get.find<
                                                            SaveProductController>();
                                                    saveProductController
                                                        .saveProduct(int.parse(
                                                            product
                                                                .productId!));
                                                  },
                                                ),
                                              ),
                                              GestureDetector(
                                                child: Container(
                                                  width: 28,
                                                  height: 28,
                                                  child: Icon(
                                                      Icons
                                                          .add_shopping_cart_outlined,
                                                      color: Colors.white,
                                                      size: 17),
                                                  decoration: BoxDecoration(
                                                      color: AppsColors
                                                          .loginColorPrimary,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(100),
                                                      )),
                                                ),
                                                onTap: () {
                                                  cartController.addCartProduct(
                                                      product.productId!,
                                                      product
                                                          .pricelist![0].price
                                                          .toString(),
                                                      1);
                                                },
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    }
                  }),
                )
              ],
            ),
          );
        }
      }
      ),
      endDrawer:  Drawer(
            child: SidebarFilterPage(),
          ),
    ),
    );
  }

  Future<bool> _onBackPressed() async {
    var result = await Get.dialog(
      AlertDialog(
        title: Text('Keluar'),
        content: Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Tidak',
              style: TextStyle(color: AppsColors.loginColorPrimary),
            ),
            onPressed: () => Get.back(result: false),
          ),
          TextButton(
            child: Text('Ya',
                style: TextStyle(color: AppsColors.loginColorPrimary)),
            onPressed: () => Get.back(result: true),
          ),
        ],
      ),
    );

    return result ?? false;
  }
}

