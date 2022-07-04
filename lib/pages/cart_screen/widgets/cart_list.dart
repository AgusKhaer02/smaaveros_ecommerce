import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../api/cart/ListCartResponse.dart';
import 'cart_item.dart';


class CartList extends StatefulWidget {
  final List<Result> listCart;
  const CartList({
    Key? key, required this.listCart,
  }) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [

          // list items
          Expanded(
            flex: 10,
            child: ListView.builder(
              itemCount: widget.listCart.length,
              itemBuilder: (context, index) {
                return CartItem(cartData: widget.listCart[index]!,);
              },
            ),
          ),

          // button for more detailed list items
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){

                },
                child: Icon(Icons.more_horiz),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.white
                    )
                ),

              ),
            ),
          ),


        ],
      ),
    );
  }


}