import 'package:flutter/material.dart';

class TableQuantity extends StatelessWidget {
  final int size;
  final int iconSize;
  TableQuantity({
    super.key, required this.size, required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            Container(
              width: size.toDouble(),
              height: size.toDouble(),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Icon(
                  Icons.remove,
                  size: iconSize.toDouble(),
                ),
              ),
            ),
            Container(
              width: 40,
              height: size.toDouble(),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(5),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey),
                ),
                child: Center(
                  child: Text(
                    "15",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: size.toDouble(),
              height: size.toDouble(),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  size: iconSize.toDouble(),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
