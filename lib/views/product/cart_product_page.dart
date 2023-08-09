import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/carts/cart_controller.dart';
import 'package:kharisma_sales_app/controllers/api/products/product_controller.dart';
import 'package:kharisma_sales_app/models/cart_product.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';
import 'package:kharisma_sales_app/widgets/tabel_quantity.dart';

class CartProductPage extends StatefulWidget {
  CartProductPage({Key? key}) : super(key: key);

  @override
  State<CartProductPage> createState() => _CartProductPageState();
}

class _CartProductPageState extends State<CartProductPage> {
  final CartController cartController = Get.put(CartController());
  final ProductController productController = Get.find<ProductController>();

  List<int> listQuantity = <int>[];
  List<int> selectedQuantities = [];
  RxInt subTotalCart = 0.obs;

  RxInt totalCart = 0.obs;

  @override
  void dispose() {
    // Clear the values of observables and reset isSelected to false when disposing the page
    subTotalCart.close();
    totalCart.close();
    for (var cartProduct in cartController.cartProductList) {
      cartProduct.isSelected = false;
    }
    super.dispose();
  }

    Future<void> getRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    cartController.fetchCartProduct();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        cartController.total_bayar.value = 0;
        cartController.selectCartAll('false');
        return true;
      },
      child: Scaffold(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Obx(() => Checkbox(
                                            value: cartController
                                                .isAllSelected.value,
                                            onChanged: (value) {
                                              cartController.selectAll(
                                                  cartController
                                                      .isAllSelected.value
                                                      .toString());
                                            },
                                          )),
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
                          child: Obx(() {
                            if (cartController.isLoading.value) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return cartController.cartProductList.isNotEmpty
                                  ? RefreshIndicator(
                                    onRefresh: getRefresh,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            cartController.cartProductList.length,
                                        itemBuilder: (context, index) {
                                          CartProduct cartProduct = cartController
                                              .cartProductList[index];
                                          int parsedQuantity =
                                              int.parse(cartProduct.quantity!);
                                          cartController.quantityGlobal.value =
                                              parsedQuantity;
                                  
                                          return ListTile(
                                            onTap: () {},
                                            title: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                GetBuilder<CartController>(
                                                  id: cartProduct.uuid, // Provide a unique identifier based on the UUID
                                                  builder: (controller) {
                                                    return Checkbox(
                                                      value: cartController
                                                          .cartProductList[index]
                                                          .isSelected,
                                                      onChanged: (value) async {
                                                        cartController.selectCartProductCheckbox(
                                                          index,
                                                          cartProduct.uuid!,
                                                        );
                                  
                                                        // Calculate the total price of the cart
                                                        cartController.calculateTotalPrice();
                                                        // await cartController.selectedCheckbox(
                                                        //         cartProduct.uuid!,
                                                        //         cartProduct.isSelected.toString());
                                                                
                                                      },
                                                    );
                                                  },
                                                ),
                                                GestureDetector(
                                                  child: Container(
                                                    width: 80,
                                                    height: 80,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(10),
                                                      color: AppsColors
                                                          .imageProductBackground,
                                                      image: DecorationImage(
                                                        image: cartProduct.product != null &&
                                                                cartProduct.product!.gdImagePath != null
                                                            ? Image.network(cartProduct.product!.gdImagePath!).image
                                                            : Image.asset(
                                                                    "assets/images/image.png")
                                                                .image,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: (){
                                                    if(cartProduct.product != null && cartProduct.product!.gdImagePath != null){
                                                      Get.toNamed(RoutesName.detailImage, arguments: cartProduct.product!.gdImagePath);
                                                    }
                                                  },
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 120,
                                                        child: Text(
                                                          cartProduct.product != null && cartProduct.product!.productName != null
                                                              ? cartProduct.product!.productName.toString()
                                                              : '',
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                        ),
                                                      ),
                                                        SizedBox(height: 2),
                                                      // satuan
                                                      Text(
                                                        'Satuan : ${cartProduct.satuan!}',
                                                        style: TextStyle(
                                                          fontSize: 12
                                                        ),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        NumberFormat.currency(
                                                          locale: 'id_ID',
                                                          symbol: 'Rp ',
                                                          decimalDigits: 0,
                                                        ).format(int.parse(
                                                            cartProduct.price ??
                                                                '0')),
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          TableQuantity(
                                                            size: 28,
                                                            iconSize: 12,
                                                            productId: cartProduct.productId!,
                                                            productTmplid:cartProduct.productTmplId!,
                                                            productUomId:cartProduct.productUomId!,
                                                            satuan: cartProduct.satuan!,
                                                            satuanStock:cartProduct.satuanStock!,
                                                            quantity: int.parse(cartProduct.quantity!).obs,
                                                            stock: cartProduct.product!.stock!,
                                                            totalPrice:cartProduct.totalPrice!,
                                                            price: cartProduct.price!,
                                                            uuid:cartProduct.uuid!,
                                                            totalCart:cartController.total_bayar,
                                                            index: index,
                                                          ),
                                                          SizedBox(width: 10),
                                                          Column(
                                                            children: [
                                                              Text(
                                                                'Stock',
                                                                style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              Text(
                                                                '(${cartProduct.sisaStock.toString()})',
                                                                style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            trailing: GestureDetector(
                                              child: Icon(Icons.delete),
                                              onTap: () {
                                                cartController.deleteCartProduct(
                                                    cartProduct.uuid!);
                                              },
                                            ),
                                            contentPadding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                          );
                                        },
                                      ),
                                  )
                                  : Center(
                                      child: Text('Empty Cart'),
                                    );
                            }
                          })),

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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Text("Biaya Pengiriman"),
                                        // Text("Rp 0")
                                        SizedBox(
                                          height: 10,
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
                                        Obx(() {
                                          return Text(
                                            NumberFormat.currency(
                                              locale: 'id_ID',
                                              symbol: 'Rp ',
                                              decimalDigits: 0,
                                            ).format(cartController
                                                .total_bayar.value),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          );
                                        })
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
                                  onPressed: () {
                                    // ambil cartController.cartProductList dimana isSelected sama dengan true
                                    List<CartProduct> cartProductList =
                                        cartController.cartProductList
                                            .where((element) =>
                                                element.isSelected == true)
                                            .toList();
                                            
                                    if (cartProductList.length == 0) {
                                      // Get snackbar
                                      cartController.errorMessage(
                                          "Silahkan pilih product terlebih dahulu");
                                    } else if (cartProductList.any(
                                        (element) => element.sisaStock! < 0)) {
                                      cartController.errorMessage(
                                          "Terdapat stock product yang tidak mencukupi");
                                    } else if(cartController.total_bayar.value == 0 || cartController.cartProductList.every((element) => element.isSelected == false)) {
                                      cartController.errorMessage("Silahkan pilih product terlebih dahulu");
                                    }else {
                                      Get.toNamed(RoutesName.cartCheckout,
                                          arguments: {
                                            "total": cartController.total_bayar,
                                            "cartProductList": cartProductList,
                                          });
                                      cartController
                                          .checkoutProductCart(cartProductList);
                                      cartController.getCheckout();
                                    }
                                  },
                                  child: Text("Beli Sekarang"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        AppsColors.loginColorPrimary,
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
      ),
    );
  }
}
