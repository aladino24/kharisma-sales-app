import 'package:flutter/material.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';

class NotificationDialog extends StatelessWidget {
  const NotificationDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 200),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: AlertDialog(
          scrollable: true,
          insetPadding: EdgeInsets.zero,
          content: Container(
            width: 350.0,
            height: 300,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Notification',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Mark All as Read',
                        style: TextStyle(
                            color: AppsColors.loginColorPrimary,
                            fontSize: 10.0),
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      // color with opacity
                      color: AppsColors.loginColorPrimary
                          .withOpacity(0.2),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  AppsColors.loginColorPrimary,
                              child: Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Terimakasih sudah melakukan pembayaran transaksi INV-2023/2403000024 sejumlah 54.300',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'Tunggu sebentar, pembayaranmu sedang kami proses..',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppsColors
                                            .loginFontColorSecondary),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    // decoration: BoxDecoration(
                    //   // color with opacity
                    //   color: AppsColors.loginColorPrimary.withOpacity(0.2),
                    // ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  AppsColors.loginColorPrimary,
                              child: Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Terimakasih sudah melakukan pembayaran transaksi INV-2023/2403000024 sejumlah 54.300',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'Tunggu sebentar, pembayaranmu sedang kami proses..',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppsColors
                                            .loginFontColorSecondary),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}