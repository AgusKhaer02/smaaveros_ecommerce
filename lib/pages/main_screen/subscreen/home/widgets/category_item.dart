import 'package:ecommerce/pages/subcategory_screen/subcategory_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../api/api.dart';
import '../../../../../api/category/ListCategoryResponse.dart';

class CategoryItem extends StatelessWidget {
  final Data categoryData;

  //index dibutuhkan hanya untuk dibagian styling pada container
  //tepatnya dibagian margin
  final int index;

  const CategoryItem({
    Key? key, required this.categoryData, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SubcategoryScreen(id: categoryData.idCategory!,),
          ),
        );
      },
      child: Container(
        // jika item pertama, maka gunakan margin left = 15.
        margin: (index == 0) ? EdgeInsets.fromLTRB(15, 20, 10, 20) : EdgeInsets.fromLTRB(0, 20, 10, 20),
        width: 155,
        height: 60,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Image.network(
                categoryData.imageCategory!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                color: Color(0x97727272),
              ),
              Center(
                child: Text(
                  categoryData.nameCategory!,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}