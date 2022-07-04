import 'package:flutter/material.dart';
import '../../../../../api/category/ListCategoryResponse.dart';
import 'category_item.dart';

class CategoryList extends StatefulWidget {
  final List<Data> listCategory;
  const CategoryList({
    Key? key, required this.listCategory,
  }) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: ListView.builder(
        itemCount: widget.listCategory.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItem(categoryData: widget.listCategory[index],index: index);
        },
      ),
    );
  }
}


