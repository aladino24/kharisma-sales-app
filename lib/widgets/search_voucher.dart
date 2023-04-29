import 'package:flutter/material.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';

class SearchVoucher extends StatelessWidget {
  const SearchVoucher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10),
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
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Masukkan Kode Voucher",
                    border: InputBorder.none),
              ),
            ),
          ),
          Container(
            height: 50,
            padding:
                EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: AppsColors.loginColorPrimary,
            ),
            child: Center(
                child: Text(
              'Apply',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ],
      ),
    );
  }
}
