import 'package:flutter/material.dart';
import 'package:kharisma_sales_app/utils/apps_colors.dart';



class RatingStar extends StatelessWidget {
  const RatingStar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          MediaQuery.of(context).size.width * 0.15,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppsColors.ratingProduct,
        // radius
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.star,
            color: Colors.white,
            size: 18,
          ),
          Text(
            "4.7",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 15),
          )
        ],
      ),
    );
  }
}
