import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/utils/apps_colors.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';
import 'package:kharisma_sales_app/widgets/rating_star.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainHeader(),
            const SizedBox(
              height: 20,
            ),
            Container(
              // width * 0.5
              height: 60,
              width: MediaQuery.of(context).size.width * 0.75,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
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
                      child: DropdownButton<String>(
                        value: 'News & Popular',
                        icon: Icon(Icons.keyboard_arrow_down_outlined),
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(),
                        style: TextStyle(
                          color: AppsColors.loginFontColorSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        onChanged: (String? newValue) {
                          // do something when value changes
                        },
                        items: <String>[
                          'News & Popular',
                          'Alat Tulis',
                          'Teknologi',
                          'Fashion',
                          'Other'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.53,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  padding: const EdgeInsets.all(5),
                  itemCount: 5,
                  itemBuilder: (context, index) {
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
                            Container(
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
                            Expanded(
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
                      ),
                      onTap: (){
                        Get.toNamed(RoutesName.detailProduct, );
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

