import 'package:ecommerce/constants/font_constants.dart';
import 'package:flutter/material.dart';

class SubpageTitle extends StatelessWidget {
  const SubpageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Text(
        "Help",
        style: FontConstants.title,
      ),
    );
  }
}