import 'package:flutter/material.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';

class NotificationProductPage extends StatelessWidget {
  NotificationProductPage({Key? key}) : super(key: key);

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
            
          ],
        ),
      ),
    );
  }
}
