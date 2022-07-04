import 'package:ecommerce/pages/detail_product_screen/detail_product_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../api/api.dart';
import '../../../../../utils/currency_money.dart';

class ProductItem extends StatelessWidget {
  final String? idProduct;
  final String? urlImage;
  final String? productName;
  final String? categoryName;
  final int? price;

  const ProductItem({
    Key? key,
    required this.urlImage,
    required this.productName,
    required this.price,
    required this.idProduct,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    DetailProductScreen(idProduct: idProduct ?? "Kosong"),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  urlImage ?? "Kosong", // image
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
                    Text(
                      categoryName ?? "Kosong",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      productName ?? "Kosong",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ), //product name
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      CurrencyMoney.indRupiah.format(price),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                      ),
                    ),
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
