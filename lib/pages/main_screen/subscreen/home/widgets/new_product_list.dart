import 'package:ecommerce/pages/main_screen/subscreen/home/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/api/product/ListProductResponse.dart';

class NewProductList extends StatefulWidget {
  final List<Data> data;
  const NewProductList({
    Key? key, required this.data,
  }) : super(key: key);

  @override
  State<NewProductList> createState() => _NewProductListState();
}

class _NewProductListState extends State<NewProductList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        itemCount: widget.data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductItem(
            idProduct: widget.data[index].idProduct!,
            productName: widget.data[index].nameProduct!,
            price: int.parse(widget.data[index].priceProduct!),
            urlImage: widget.data[index].imageProduct!,
            categoryName: widget.data[index].nameCategory ?? "Kosong",
          );
        },
      ),
    );
  }
}


