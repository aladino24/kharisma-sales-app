import 'package:flutter/material.dart';


class DiskonProduct extends StatelessWidget {
  const DiskonProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 2, bottom: 2, left: 6, right: 6),
        child: Text(
          "15% OFF",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
