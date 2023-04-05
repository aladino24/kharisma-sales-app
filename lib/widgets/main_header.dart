import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:kharisma_sales_app/utils/apps_colors.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 0),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: const Offset(0, 0),
                      blurRadius: 8)
                ]),
            child: TextField(
              autofocus: false,
              onSubmitted: (val) {},
              onChanged: (val) {},
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none),
                hintText: " Search...",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CircleAvatar(
                    backgroundColor: AppsColors.loginColorPrimary,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )),
          const SizedBox(width: 10),
          badge.Badge(
            // badgeContent: const Text(
            //   "1",
            //   style: TextStyle(color: Colors.white),
            // ),
            badgeStyle: badge.BadgeStyle(
                badgeColor: AppsColors.loginColorPrimary,
                padding: const EdgeInsets.symmetric(horizontal: 4)),
            child: const Icon(
              Icons.bookmark_outline,
              color: Colors.grey,
              size: 25,
            ),
          ),
          const SizedBox(width: 10),
          badge.Badge(
            // badgeContent: const Text(
            //   "1",
            //   style: TextStyle(color: Colors.white),
            // ),
            badgeStyle: badge.BadgeStyle(
                badgeColor: AppsColors.loginColorPrimary,
                padding: const EdgeInsets.symmetric(horizontal: 4)),
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.grey,
              size: 25,
            ),
          ),
          const SizedBox(width: 10),
          badge.Badge(
            badgeContent: const Text(
              "1",
              style: TextStyle(
                color: Colors.white,
                fontSize: 9,
              ),
            ),
            badgeStyle: badge.BadgeStyle(
              badgeColor: AppsColors.loginColorPrimary,
              elevation: 0,
            ),
            child: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.grey,
              size: 25,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 46,
            width: 46,
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.menu,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
