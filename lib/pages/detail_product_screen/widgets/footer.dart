import 'package:ecommerce/utils/alerts.dart';
import 'package:ecommerce/utils/login_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:need_resume/need_resume.dart';

import '../../../api/api.dart';
import '../../../utils/currency_money.dart';
import '../../auth/login/login.dart';
import '../../cart_screen/cart_screen.dart';

class Footer extends StatefulWidget {
  final int totalPrice;
  final bool editCart;
  final String idProduct;
  final int qty;

  const Footer(
      {Key? key,
      required this.totalPrice,
      this.editCart = false,
      required this.idProduct,
      required this.qty})
      : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends ResumableState<Footer> {
  bool? isAllowed;

  checkPrefBeforeCart() async {
    //jika belum login, login dulu
    LoginPref.checkPref().then((value) {
      this.isAllowed = value;
    });
  }

  addToCart(BuildContext context) {
    // ambil nliai dari sharedpref berupa id user
    LoginPref.getValuePref().then((value) {
      // add to cart
      // mempersiapkan nilai iduser, idproduct, quantity dan masukan dalam variabel data
      var data = {
        "id_user": value["id_user"]!,
        "id_product": widget.idProduct,
        "quantity": widget.qty.toString(),
      };

      // mulai menambahkan data ke keranjang
      Api.addToCart(data).then((value) {
        //muncul pesan sukses
        Alerts.showMessage("Your item is added to cart", context);
        // pergi ke halaman cart page
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CartScreen(),
          ),
        );
      }); //Api.addToCart

    }); //loginPred

  }

  @override
  void initState() {
    checkPrefBeforeCart();
    super.initState();
  }

  @override
  void onResume() {
    setState(() {
      // checkPrefBeforeCart();
    });
    super.onResume();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.grey, spreadRadius: 0.1, blurRadius: 5)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
              Text(
                CurrencyMoney.indRupiah.format(widget.totalPrice),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(),
          ),
          (widget.editCart)
              ? SizedBox()
              : ElevatedButton(
                  onPressed: () {
                    // cek apakah variabel isAllowed adalah false(belum login)
                    // percabangan ini akan di abaikan ketika nilai dari isAllowed adalah true dan langsung loncat ke perintah selanjutnya
                    if (this.isAllowed == false) {
                      // maka muncul pesan ini dan pergi ke halaman login terlebih dahulu
                      Alerts.showMessage(
                          "You have to login to this app", context);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      ).then((value) {
                        checkPrefBeforeCart();
                      });

                      // melakukan return sehingga perintah2 selanjutnya tidak akan tereksekusi
                      return null;
                    }
                    // // menambahkan item ke cart
                    addToCart(context);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orange)),
                  child: Text(
                    "Add to cart",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () {
              //cek dulu apakah sudah login, jika tidak maka lempar ke halaman login
              if (this.isAllowed == false) {
                Alerts.showMessage("You have to login to this app", context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                ).then((value) {
                  checkPrefBeforeCart();
                });

                return null;
              }
              // pergi ke halaman cart screen
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey[400])),
            child: Text(
              "Go to Cart",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
