import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/products/category_controller.dart';
import 'package:kharisma_sales_app/controllers/api/products/product_controller.dart';
import 'package:kharisma_sales_app/controllers/components/sidebar_category_controller.dart';

class SidebarFilterPage extends StatelessWidget {
  SidebarFilterPage({super.key});

  final ProductController productController = Get.put(ProductController());
  final CategoryController categoryController = Get.put(CategoryController());
  final SidebarCategoryController sidebarCategoryController = Get.put(SidebarCategoryController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[300]!,
                    width: 1,
                  ),
                ),
              ),
              child: Text(
                'Filter',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                title: Text('Harga'),
                onTap: () {},
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color:
                                sidebarCategoryController.variantHarga.value ==
                                        'termurah'
                                    ? AppsColors.loginColorPrimary
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: sidebarCategoryController
                                            .variantHarga.value ==
                                        'termurah'
                                    ? AppsColors.loginColorPrimary
                                    : AppsColors.loginFontColorSecondary),
                          ),
                          child: InkWell(
                            child: Center(
                                child: Text(
                              "Termurah",
                              style: TextStyle(
                                  color: sidebarCategoryController
                                              .variantHarga.value ==
                                          'termurah'
                                      ? Colors.white
                                      : AppsColors.loginFontColorSecondary),
                            )),
                            onTap: () {
                              sidebarCategoryController.setVariantHarga('termurah');
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color:
                                sidebarCategoryController.variantHarga.value == 'termahal'
                                    ? AppsColors.loginColorPrimary
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: sidebarCategoryController.variantHarga.value ==
                                        'termahal'
                                    ? AppsColors.loginColorPrimary
                                    : AppsColors.loginFontColorSecondary),
                          ),
                          child: InkWell(
                            child: Center(
                                child: Text(
                              "Termahal",
                              style: TextStyle(
                                  color: sidebarCategoryController.variantHarga.value ==
                                          'termahal'
                                      ? Colors.white
                                      : AppsColors.loginFontColorSecondary),
                            )),
                            onTap: () {
                              sidebarCategoryController.setVariantHarga('termahal');
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                title: Text('Published'),
                onTap: () {
                  // Handle sidebar menu item 2 tap
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color: AppsColors.loginColorPrimary,
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: AppsColors.loginColorPrimary),
                          ),
                          child: InkWell(
                            child: Center(
                                child: Text(
                              "Terbaru",
                              style: TextStyle(color: Colors.white),
                            )),
                            onTap: () {},
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color: AppsColors.loginColorPrimary,
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: AppsColors.loginColorPrimary),
                          ),
                          child: InkWell(
                            child: Center(
                                child: Text(
                              "All",
                              style: TextStyle(color: Colors.white),
                            )),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // button cari produk
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppsColors.loginColorPrimary,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppsColors.loginColorPrimary),
                    ),
                    child: InkWell(
                      child: Center(
                        child: Text(
                          "Cari Produk",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onTap: () async {
                         await productController.fetchProductByFilter(productController.searchEditController.text, sidebarCategoryController.variantHarga.value, categoryController.selectedValue.value);
                         // close drawer
                          Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
