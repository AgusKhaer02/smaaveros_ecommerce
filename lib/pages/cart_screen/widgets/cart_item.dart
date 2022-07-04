import 'package:flutter/material.dart';

import '../../../api/api.dart';
import '../../../api/cart/ListCartResponse.dart';
import '../../../utils/currency_money.dart';
import '../../detail_product_screen/detail_product_screen.dart';

class CartItem extends StatefulWidget {
  final Result cartData;

  const CartItem({Key? key, required this.cartData}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  deleteCart() {
    Api.deleteCart(widget.cartData.idCart!).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 0.5, blurRadius: 4),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            Image.network(
              widget.cartData.imageProduct!,
              width: 120,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 5, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(

                          child: Text(
                            widget.cartData.nameProduct!,

                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            deleteCart();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Quantity : ${widget.cartData.quantity!}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Price : " +
                          CurrencyMoney.indRupiah.format(widget.cartData.priceProduct!),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailProductScreen(
                                    editCart: true, idProduct: widget.cartData.idProduct!,
                                    // stream: LoginPref.streamLoginPref.stream,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              "Edit",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                          Text(
                            CurrencyMoney.indRupiah.format(
                                int.parse(widget.cartData.priceProduct!) *
                                    int.parse(widget.cartData.quantity!)),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
