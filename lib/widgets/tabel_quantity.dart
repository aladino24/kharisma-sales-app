import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/api/carts/cart_controller.dart';

class TableQuantity extends StatelessWidget {
  final int size;
  final int iconSize;
  final RxInt quantity;
  final String uuid;
  final String stock;
  final int index;
  TableQuantity({
    super.key, required this.size, required this.iconSize, required this.quantity, required this.uuid, required this.stock, required this.index,
  });

  final CartController cartController = Get.put(CartController());

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
                child: GestureDetector(
                  child: Icon(
                    Icons.remove,
                    size: iconSize.toDouble(),
                  ),
                  onTap: (){
                    cartController.decrement(uuid, quantity, stock);
                  },
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
                  child: GetBuilder<CartController>(
                    id: index,
                    builder: (_) {
                      return Text(
                        '${quantity}',
                        style: TextStyle(fontSize: 15.0),
                      );
                    },
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
                child: GestureDetector(
                  child: Icon(
                    Icons.add,
                    size: iconSize.toDouble(),
                  ),
                  onTap: (){
                    cartController.increment(uuid, quantity, stock, index);
                  },
                ),
              ),
            ),
          ],
        ),
      );
  }
}
