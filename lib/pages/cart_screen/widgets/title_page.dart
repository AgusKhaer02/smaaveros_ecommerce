import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Text(
        "My Cart",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
    );
  }
}