import 'package:flutter/material.dart';

import '../../../api/category/DetailSubcategoryResponse.dart';
import 'detail_subcategory_item.dart';

class DetailSubcategoryList extends StatefulWidget {
  final List<Data> detailSubcategoryData;
  final String subcategory;

  const DetailSubcategoryList({
    Key? key,
    required this.subcategory,
    required this.detailSubcategoryData,
  }) : super(key: key);

  @override
  State<DetailSubcategoryList> createState() => _DetailSubcategoryListState();
}

class _DetailSubcategoryListState extends State<DetailSubcategoryList> {
  @override
  Widget build(BuildContext context) {
    if (widget.detailSubcategoryData.length > 0) {
      return Expanded(
        child: GridView.builder(
          itemCount: widget.detailSubcategoryData.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return DetailSubcategoryItem(
              data: widget.detailSubcategoryData[index],
            );
          },
        ),
      );
    } else {
      return Expanded(
        child: Center(
          child: Text(
            "Detail Subcategory from ${widget.subcategory} is empty!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    }
  }
}
