import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/utils/apps_colors.dart';
import 'package:kharisma_sales_app/widgets/diskon_product.dart';

class OrderInformation extends StatelessWidget {
  const OrderInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

