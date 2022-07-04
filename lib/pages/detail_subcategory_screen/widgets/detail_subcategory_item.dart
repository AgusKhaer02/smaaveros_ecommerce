import 'package:ecommerce/pages/detail_product_screen/detail_product_screen.dart';
import 'package:ecommerce/pages/detail_subcategory_screen/detail_subcategory_screen.dart';
import 'package:flutter/material.dart';

import '../../../api/api.dart';
import '../../../api/category/DetailSubcategoryResponse.dart';

class DetailSubcategoryItem extends StatelessWidget {
  final Data data;
  const DetailSubcategoryItem({
    Key? key, required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailProductScreen(idProduct: data.idProduct!,),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                 data.imageProduct!,
                  // image
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.nameProduct!), //product name
                    SizedBox(
                      height: 5,
                    ),
                    Text(data.priceProduct!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}