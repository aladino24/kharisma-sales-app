import 'package:flutter/material.dart';
import 'package:kharisma_sales_app/utils/apps_colors.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';
import 'package:flutter/cupertino.dart';

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
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "News & Popular",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppsColors.loginFontColorSecondary),
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.black,
                          ),
                        ],
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
                  padding: const EdgeInsets.all(10),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Container(
                            // heigh sesuai dengan tinggi parent * 0.5
                            height: MediaQuery.of(context).size.height * 0.20,
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
                          Container(
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
                                      color: AppsColors.loginFontColorPrimaryDark),
                                ),
                                Text(
                                  "Seller Price : Rp 2.500",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppsColors.loginFontColorPrimaryDark),
                                ),
                                Text(
                                  "Customer Price : Rp 3.500",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppsColors.loginFontColorPrimaryDark),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
