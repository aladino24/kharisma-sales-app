import 'package:flutter/material.dart';
import 'package:kharisma_sales_app/utils/apps_colors.dart';
import 'package:kharisma_sales_app/widgets/diskon_product.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';
import 'package:kharisma_sales_app/widgets/tabel_quantity.dart';

class CartProductPage extends StatelessWidget {
  CartProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MainHeader(
              iconBookmark: false,
              iconCart: false,
              iconNotification: false,
            ),
            // Cart product
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    child: CheckboxListTile(
                      value: false,
                      onChanged: (value) {},
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppsColors.imageProductBackground,
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/product.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bolpoin G-Soft",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                DiskonProduct(),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Rp 10.000",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TableQuantity(size: 20, iconSize: 12)
                              ],
                            ),
                          ),
                        ],
                      ),
                      secondary: Icon(Icons.delete),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
