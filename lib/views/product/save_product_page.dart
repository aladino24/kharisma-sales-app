import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kharisma_sales_app/controllers/api/carts/cart_controller.dart';
import 'package:kharisma_sales_app/controllers/api/products/product_controller.dart';
import 'package:kharisma_sales_app/controllers/api/products/save_product_controller.dart';
import 'package:kharisma_sales_app/models/product.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';
import 'package:shimmer/shimmer.dart';

class SaveProductPage extends StatelessWidget {
  SaveProductPage({Key? key}) : super(key: key);

  final ProductController productController = Get.find<ProductController>();
  final SaveProductController saveProductController = Get.put(SaveProductController());
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainHeader(
              iconBookmark: false,
              iconCart: false,
              iconNotification: false,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 10.0, left: 20.0, right: 10.0, bottom: 5.0),
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Text(
                    "Wishlist",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Obx(() => Text(
                    "( ${saveProductController.products.length} Barang )",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      color: AppsColors.loginFontColorSecondary,
                    ),
                  ),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Text(
                "Ketuk tahan / klik icon favorite Untuk Menghapus barang dari wishlist",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: AppsColors.loginFontColorSecondary,
                ),
              ),
            ),
            
            Expanded(
              child: Obx(() {
                if (saveProductController.isLoading.value) {
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
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.53,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      padding: const EdgeInsets.all(5),
                      itemCount: saveProductController.products.length,
                      itemBuilder: (context, index) {
                        Product product = saveProductController.products[index];
                        //  print('Ini image ' + product.image!);
                        return GestureDetector(
                          child: Container(
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
                                    height: Get.height * 0.2,
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
                                    // Get.toNamed(RoutesName.detailProduct,
                                    //     arguments: product);
                                    // print product
                                    print(product.productUom);
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
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: AppsColors
                                                    .loginFontColorPrimaryDark),
                                          ),
                                           Text(
                                                  'Price : ${NumberFormat.currency(
                                                    locale: 'id_ID',
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0,
                                                  ).format(int.parse(product.priceUtama!))}',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: AppsColors
                                                          .loginFontColorPrimaryDark),
                                                ),
                                                Text(
                                                  'Satuan : ${product.labelUtama}',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.red
                                                    ),
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
                                        MainAxisAlignment.end,
                                    children: [
                                      // RatingStar(),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                                    color: product.isWishlist == 1 ? Colors.red : Colors.grey,
                                                    size: 18),
                                                  onTap: () async{
                                                     Get.lazyPut(() => SaveProductController());
                                                    final saveProductController = Get.find<SaveProductController>();
                                                    if(product.isWishlist == 0){ 
                                                      await saveProductController.saveProduct(int.parse(product.productId!));                                                          
                                                    }else{
                                                      await saveProductController.deleteProduct(product.productId!);
                                                    }

                                                    productController.fetchProduct();
                                                    saveProductController.fetchProduct();
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
                                              onTap: () async{
                                                // await cartController.addCartProduct(
                                                //       product.productId!,
                                                //       product
                                                //           .pricelist![0].price
                                                //           .toString(),
                                                //       1);
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
                          ),
                          onLongPress: () {
                            Get.defaultDialog(
                              title: 'Delete Product',
                              middleText:
                                  'Are you sure want to delete this product from wishlist?',
                              textConfirm: 'Yes',
                              textCancel: 'No',
                              confirmTextColor: Colors.white,
                              buttonColor: AppsColors.loginColorPrimary,
                              cancelTextColor: AppsColors.loginColorPrimary,
                              onConfirm: () async {
                                await saveProductController
                                    .deleteProduct(product.productId);
                                Get.back();
                              },
                              onCancel: () {},
                            );
                          },
                        );
                      });
                }
              }),
            )
          ],
        ),
      ),
    ), onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Fetch data saat pengguna kembali ke halaman ini
    await productController.fetchProduct();
    return true;
  }
}
