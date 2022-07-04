import 'package:flutter/material.dart';

class DetailSubcategoryTitleNProductName extends StatelessWidget {
  final String subcategory;
  const DetailSubcategoryTitleNProductName({
    Key? key, required this.subcategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20,bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "List Subcategory",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          Text(
            subcategory,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.black54),
          ),
        ],
      ),
    );
  }
}