import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/utils/apps_colors.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';
import 'package:kharisma_sales_app/widgets/rating_star.dart';

class SaveProductPage extends StatelessWidget {
  SaveProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 10.0, bottom: 5.0),
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
                  SizedBox(width: 10,),
                  Text(
                    "( 3 Barang )",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      color: AppsColors.loginFontColorSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.53,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    padding: const EdgeInsets.all(5),
                    itemCount: 3,
                    itemBuilder: (context, index) {
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
                                    color: AppsColors.imageProductBackground,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0),
                                    )),
                                child: Image.asset(
                                  'assets/images/product.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              onTap: () {
                                Get.toNamed(RoutesName.detailProduct);
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Product Name",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: AppsColors
                                                .loginFontColorPrimaryDark),
                                      ),
                                      Text(
                                        "Seller Price : Rp 2.500",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: AppsColors
                                                .loginFontColorPrimaryDark),
                                      ),
                                      Text(
                                        "Customer Price : Rp 3.500",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Get.toNamed(RoutesName.detailProduct);
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RatingStar(),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.15,
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
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(100),
                                              )),
                                          child: Icon(Icons.favorite,
                                              color: Colors.red, size: 18),
                                        ),
                                        Container(
                                          width: 28,
                                          height: 28,
                                          child: Icon(
                                              Icons.add_shopping_cart_outlined,
                                              color: Colors.white,
                                              size: 17),
                                          decoration: BoxDecoration(
                                              color: AppsColors.loginColorPrimary,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(100),
                                              )),
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
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
