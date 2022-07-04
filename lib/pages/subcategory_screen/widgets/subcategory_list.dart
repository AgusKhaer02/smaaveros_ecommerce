import 'package:ecommerce/pages/subcategory_screen/widgets/subcategory_item.dart';
import 'package:flutter/material.dart';

import '../../../api/category/ListSubcategoryResponse.dart';

class SubcategoryList extends StatefulWidget {
  // 2
  // class ini butuh constructor subcategoryListData dan category
  final List<Data> subcategoryListData;
  final String category;
  const SubcategoryList({
    Key? key, required this.subcategoryListData, required this.category,
  }) : super(key: key);

  @override
  State<SubcategoryList> createState() => _SubcategoryListState();
}

class _SubcategoryListState extends State<SubcategoryList> {


  @override
  Widget build(BuildContext context) {

    //jika jumlah dari list subcategorynya adalah lebih dari 0 atau tidak kosong
    if(widget.subcategoryListData.length > 0){
      // tampilkan listnya
      return Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            itemCount: widget.subcategoryListData.length,
            itemBuilder: (context, index) {
              // memamnggil class category item
              return SubcategoryItem(data: widget.subcategoryListData[index],);
            }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          ),
        ),
      );
    }else{
      // muncul pesan error di tengah halaman
      // "List subcategory is empty"
      return Expanded(
        child: Center(
          child: Text(
            "List subcategory from ${widget.category} is empty!",
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