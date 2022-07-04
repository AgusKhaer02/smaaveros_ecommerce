import 'package:ecommerce/pages/detail_subcategory_screen/detail_subcategory_screen.dart';
import 'package:flutter/material.dart';

import '../../../api/category/ListSubcategoryResponse.dart';

class SubcategoryItem extends StatelessWidget {
  final Data data;
  const SubcategoryItem({
    Key? key, required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailSubcategoryScreen(idSubcategory: data.idSubcategory!, subcategory: data.nameSubcategory!,),
          ),
        );
      },
      child: Container(
        width: 150,
        height: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Image.network(
                data.imageSubcategory!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                color: Color(0x97727272),
              ),
              Center(
                child: Text(
                  data.nameSubcategory!,
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



