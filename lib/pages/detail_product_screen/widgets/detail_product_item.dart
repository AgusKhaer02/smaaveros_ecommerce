import 'package:flutter/material.dart';

import '../../../utils/currency_money.dart';

class DetailProductItem extends StatelessWidget {
  final String nameProduct;
  final String nameCategory;
  final String descProduct;
  final String stockProduct;
  final int priceProduct;
  const DetailProductItem({
    Key? key, required this.nameProduct, required this.descProduct, required this.priceProduct, required this.stockProduct, required this.nameCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nameCategory),
              SizedBox(
                height: 5,
              ),
              Text(
                nameProduct,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "$stockProduct Stock Available",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.orange),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Price"),
              Text(
                CurrencyMoney.indRupiah.format(priceProduct),
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}