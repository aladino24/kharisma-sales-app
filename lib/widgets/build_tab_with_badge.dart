import 'package:flutter/material.dart';

Widget buildTabWithBadge(String text, String badgeCount) {
  return Stack(
    children: [
        Tab(
          text: text + ' (${badgeCount.toString()})',
        ),
    ],
  );
}