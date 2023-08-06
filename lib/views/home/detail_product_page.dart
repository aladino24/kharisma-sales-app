import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/carts/cart_controller.dart';
import 'package:kharisma_sales_app/controllers/api/products/product_controller.dart';
import 'package:kharisma_sales_app/models/product.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';
import 'package:kharisma_sales_app/controllers/components/detail_product_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class DetailProductPage extends StatelessWidget {
  DetailProductPage({super.key});

  CarouselController? carouselController = CarouselController();
  final DetailProductController detailProductController = Get.put(DetailProductController(
    product: Get.arguments
  ));
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

   void initProduct() {
    detailProductController.setProductStock(product!);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => initProduct());
    // get arguments json
    // print(product!.productName);
    final TextEditingController quantityController = TextEditingController();
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
                                // DiskonProduct()
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 5),
                          //   child: RatingStar(),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text(
                                                  'Price : ${NumberFormat.currency(
                                                    locale: 'id_ID',
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0,
                                                  ).format(int.parse(product!.priceUtama!))}',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: AppsColors
                                                          .loginFontColorPrimaryDark),
                                                ),
                                                Text(
                                                  'Satuan : ${product!.labelUtama}',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.red
                                                    ),
                                                ),
                              ],
                            ),
                          ),

                          // Quantity product
                          GetBuilder<DetailProductController>(
                              builder: (controller) {
                            quantityController.text = detailProductController
                                .quantity.value
                                .toString();
                            return Padding(
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
                                            width: 55,
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
                                                // child: Text(
                                                //   "${detailProductController.quantity.value}",
                                                //   style: TextStyle(
                                                //     color: Colors.black,
                                                //     fontSize: 15,
                                                //   ),
                                                // ),
                                                child: TextFormField(
                                                  controller:
                                                      quantityController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style:
                                                      TextStyle(fontSize: 15.0),
                                                  textAlign: TextAlign.center,
                                                  onChanged: (value) {
                                                    final ProductUom? selectedVariant = detailProductController.variant.value != '' ? product!.productUom!.firstWhere(
                                                  (uom) => uom.label == detailProductController.variant.value) : 
                                                  product!.productUom!.firstWhere((uom) => uom.label == product!.productUom![0].label);
                                                    String cleanedValue = value
                                                        .replaceAll('-', '');
                                                    cleanedValue = cleanedValue
                                                        .replaceAll(',', '')
                                                        .replaceAll('.', '');
                                                    int quantity = int.tryParse(
                                                            cleanedValue) ??
                                                        0;

                                                    if (cleanedValue.isNotEmpty && quantity != 0) {
                                                      
                                                      if (quantity > int.parse(product!.stock.toString())) {
                                                        // if(detailProductController.variant.value.isNotEmpty){
                                                        //    int selectedVariantStock = int.parse(selectedVariant!.stock!);
                                                        //     int inputQuantity = int.tryParse(value.replaceAll('-', '').replaceAll(',', '').replaceAll('.', '')) ?? 0;
                                                        //     int maxAllowedQuantity = int.parse(product!.stock!);
                                                            
                                                        //     int calculatedQuantity = selectedVariantStock * inputQuantity;
                                                        //     int finalQuantity = calculatedQuantity < maxAllowedQuantity ? calculatedQuantity : maxAllowedQuantity;

                                                        //     quantityController.text = finalQuantity.toString();
                                                        //      detailProductController.quantity.value = int.parse(product!.stock.toString());
                                                        // }
                                                        quantityController.text = product!.stock.toString();
                                                        detailProductController.quantity.value = int.parse(product!.stock.toString());
                                                      } else if (quantity == 0) {
                                                        quantityController.text = '0';
                                                        detailProductController.quantity.value = 1;
                                                      } else {
                                                        detailProductController.quantity.value = quantity;
                                                      }
                                                    } else {
                                                      detailProductController.quantity.value = 1;
                                                    }

                                                    detailProductController.updateTotalStock();
                                                  },
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
                                  Obx(() => Text(
                                      "( Stock : ${detailProductController.totalStock.value} )",
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: AppsColors.loginFontColorPrimaryDark,
                                      ),
                                    )),
                                ],
                              ),
                            );
                          }),

                          SizedBox(
                            height: 15,
                          ),

                            // Satuan product
                          Obx(
                            () => Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Satuan (${product!.productUom!.length})",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    child: Row(
                                      children: product!.productUom!
                                          .map((productItem) {
                                        final String? label = productItem.label;
                                        bool isSelected = detailProductController
                                                    .variant.value ==
                                                label;
                                        return Container(
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          width: 90,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? AppsColors.loginColorPrimary
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: isSelected
                                                  ? AppsColors.loginColorPrimary
                                                  : AppsColors
                                                      .loginFontColorSecondary,
                                            ),
                                          ),
                                          child: InkWell(
                                            child: Center(
                                              child: Text(
                                                label!,
                                                style: TextStyle(
                                                  color: isSelected
                                                      ? Colors.white
                                                      : AppsColors
                                                          .loginFontColorSecondary,
                                                ),
                                              ),
                                            ),
                                            onTap: () { 
                                              detailProductController
                                                .setVariant(label);
                                            },
                                          ),
                                        );
                                      }).toList(),
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
                                     final ProductUom? selectedVariant = detailProductController.variant.value != '' ? product!.productUom!.firstWhere(
                                                  (uom) => uom.label == detailProductController.variant.value) : 
                                                  product!.productUom!.firstWhere((uom) => uom.label == product!.productUom![0].label);
                                    // lazyput cartcontroller
                                    Get.lazyPut(() => CartController());
                                    final cartController =
                                        Get.find<CartController>();
                                    cartController.addCartProduct(
                                        product!.productId!,
                                        selectedVariant!.productTmplId!,
                                        selectedVariant.productUomId!,
                                        selectedVariant.label!,
                                        selectedVariant.stock!,
                                        selectedVariant.productPricelist![0].price!,
                                        detailProductController.quantity.value);
                                  },
                                ),
                                Obx(() {
                                  var totalStock = detailProductController.totalStock.value;
                                  return GestureDetector(
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
                                    onTap: () async {
                                      print("total stock : ${totalStock}");
                                      // shared preferences
                                      final prefs =
                                          await SharedPreferences.getInstance();
                                      var hasToken = prefs.getString('token');
                                      if (hasToken == null) {
                                        Get.offAllNamed(RoutesName.loginCustomer);
                                      } else {
                                        if (quantityController.text.isNotEmpty && quantityController.text != '0') {
                                          final int selectedQuantity = int.tryParse(quantityController .text) ?? 0;
                                           final ProductUom? selectedProductUom = detailProductController.variant.value != '' ?
                                          product!.productUom!.firstWhere(
                                                  (uom) => uom.label == detailProductController.variant.value) : 
                                                  product!.productUom!.firstWhere((uom) => uom.label == product!.productUom![0].label); // Replace 'KLG' with the desired unit label.
                                          final ProductPricelist? minPrice = selectedProductUom!.productPricelist!
                                                  .reduce((curr, next) => int.parse(curr.minQuantity!) < int.parse(next.minQuantity!) ? curr : next);

                                          if (minPrice != null && selectedQuantity < int.parse(minPrice.minQuantity!)) {
                                            Get.snackbar(
                                              "Gagal",
                                              'Quantity minimum untuk produk ini adalah ${minPrice.minQuantity}',
                                              backgroundColor: Colors.red,
                                              colorText: Colors.white,
                                            );
                                          } else if(totalStock < 0){
                                            Get.snackbar(
                                            "Gagal",
                                            "Pembelian melebihi jumlah stock",
                                            backgroundColor: Colors.red,
                                            colorText: Colors.white,
                                          );
                                          } else {
                                            Get.toNamed(
                                              RoutesName.checkoutProduct,
                                              arguments: {
                                                "productId": product!.productId,
                                                "productTmplid": product!.productTmplId,
                                                "productName": product!.productName,
                                                "price": minPrice!.price,
                                                "quantity":detailProductController.quantity.value,
                                                'imageProduct': product!.gdImagePath,
                                                'weight': product!.weight,
                                                'satuan' : detailProductController.variant.value
                                              },
                                            );
                                            productController.checkPrice(
                                                product!.productTmplId,
                                                selectedProductUom.productUomId,
                                                detailProductController
                                                    .quantity.value);
                                            productController.buyNow(
                                                    product!.productId,
                                                    product!.productTmplId,
                                                    selectedProductUom.productUomId,
                                                    selectedProductUom.label,
                                                    selectedProductUom.stock,
                                                    minPrice.price,
                                                    detailProductController.quantity.value
                                                  ).then((value) =>
                                                    productController
                                                        .getBuyNow());
                                          }
                                        } else if (quantityController.text == '0') {
                                          Get.snackbar(
                                            "Gagal",
                                            "Quantity tidak boleh kosong",
                                            backgroundColor: Colors.red,
                                            colorText: Colors.white,
                                          );
                                        }else {
                                          Get.snackbar(
                                            "Gagal",
                                            "Quantity tidak boleh kosong",
                                            backgroundColor: Colors.red,
                                            colorText: Colors.white,
                                          );
                                        }
                                      }
                                    });
                                })
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

                        

                          SizedBox(height: 15),

                          // varian diganti pricelist
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pricelist",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 5),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: product!.productUom!.length,
                                itemBuilder: (context, index) {
                                  final pricelist = product!.productUom![index];

                                  // Lakukan pengecekan jika pricelist.productPricelist tidak null dan memiliki data.
                                  if (pricelist.productPricelist != null) {
                                    return ListTile(
                                      title:
                                          Text('Satuan : ${pricelist.label}'),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: pricelist.productPricelist!
                                            .map((price) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  'Price: ${NumberFormat.currency(
                                                locale: 'id_ID',
                                                symbol: 'Rp ',
                                                decimalDigits: 0,
                                              ).format(int.parse(price.price!))}'),
                                              Text(
                                                  'Min Quantity : ${price.minQuantity}'),
                                              SizedBox(height: 10)
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    );
                                  } else {
                                    return ListTile(
                                      title: Text('Unit: ${pricelist.label}'),
                                      subtitle: Text('No pricelist available'),
                                    );
                                  }
                                },
                              ),
                            ],
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
                                  '• Nama Barang : ${product!.productName}\n'
                                  '• Kategori : ${product!.productTag!.name}\n'
                                  '• Unit : ${product!.unit}\n'
                                  '• Berat : ${product!.weight}\n'
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
