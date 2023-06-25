import 'package:flutter/material.dart';
import 'constant.dart';

class DefaultButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;
  const DefaultButton({
    Key? key, required this.btnText, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            btnText.toUpperCase(),
            style: TextStyle(color: kWhiteColor),
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: kLessPadding),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kShape),
            ),
            backgroundColor: kPrimaryColor,
          ),
        )

    );
  }
}