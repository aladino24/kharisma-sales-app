import 'package:flutter/material.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';

Widget buildTabWithBadge(String text, String badgeCount) {
  return Stack(
    children: [
        Tab(
          text: text + ' (${badgeCount.toString()})',
        ),
    ],
  );
}