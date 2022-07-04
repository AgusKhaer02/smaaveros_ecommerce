import 'dart:async';

import 'package:ecommerce/pages/auth/login/login.dart';
import 'package:ecommerce/pages/cart_screen/widgets/footer.dart';
import 'package:ecommerce/pages/cart_screen/widgets/title_page.dart';
import 'package:ecommerce/pages/detail_product_screen/detail_product_screen.dart';
import 'package:ecommerce/utils/alerts.dart';
import 'package:flutter/material.dart';
import '../../api/api.dart';
import '../../api/cart/ListCartResponse.dart';
import '../../utils/currency_money.dart';
import '../../utils/login_pref.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String idUser = "";
  String username = "";
  int totalPrice = 0;

  // memuat data keranjang
  Future<ListCartResponse> getCart() {
    return LoginPref.getValuePref().then((value) async {
      idUser = value['id_user']!;
      return Api.getListCart(idUser);
    });
  }

  // mengambil username dari pref
  // ini untuk nama
  getUsername() {
    LoginPref.getValuePref().then((value) async {
      username = value['username']!;
    });
  }

  // tentukan total cart secara keseluruhan
  setTotalCart(List<Result> result) {
    //kosongkan dulu totalpricenya sebelum menambahkan nilai baru
    totalPrice = 0;
    List.generate(result.length, (index) {
      totalPrice += (int.parse(result[index].quantity!) *
          int.parse(result[index].priceProduct!));
    });
  }

  // check pref login sebelum muncul halaman cart
  checkPrefBeforeCart() async {
    //jika belum login, login dulu
    LoginPref.checkPref().then((value) {

      if (value == false) {
        Alerts.showMessage("You have to login to this app", context);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
            (route) => false);
      }
    });
  }

  @override
  void initState() {
    checkPrefBeforeCart();
    getUsername();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: loadingData(),
      ),
    );
  }

  Widget loadingData() {
    return FutureBuilder(
      future: getCart(),
      builder: (context, AsyncSnapshot<ListCartResponse> snapshot) {
        // print("snapshot has data => " + snapshot.hasData.toString());
        if (snapshot.hasData) {
          // cek apakah cart itu berisi?
          if (snapshot.data!.result!.length > 0) {
            // jika ya, maka muncul list cart dan set total cartnya
            setTotalCart(snapshot.data!.result!);
            // print(snapshot.data!.result![0].nameProduct);
            return showCart(snapshot.data!.result!);
          } else {
            // sebaliknya, muncul pesan no cart
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "No cart Available, let's go shopping!",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF002B5A)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back_ios_new, size: 14),
                        Text(
                          "Back",
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Something wrong"),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget showCart(List<Result> listCart) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        TitlePage(),
        // cart list
        Expanded(
          child: showList(listCart),
        ),
        //write notes, total price, checkout button
        Footer(
          totalPrice: totalPrice,
          cartList: List.generate(
            listCart.length,
            (index) => {
              "productName": listCart[index].nameProduct!,
              "price": listCart[index].priceProduct!,
              "quantity": listCart[index].quantity!,
            },
          ),
        ),
      ],
    );
  }

  // menampilkan list Cart
  Widget showList(List<Result> listCart) {
    return ListView.builder(
      itemCount: listCart.length,
      itemBuilder: (context, index) {
        //item cart
        return Container(
          width: double.infinity,
          height: 120,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 0.5,
                blurRadius: 4,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Row(
              children: [
                Image.network(
                  listCart[index].imageProduct!,
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
                        // title and delete button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // nama produk
                            Text(
                              listCart[index].nameProduct!,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            //tombol hapus
                            IconButton(
                              onPressed: () {
                                Alerts.showAlertYesNo(
                                  onPressYes: () {
                                    Api.deleteCart(listCart[index].idCart!)
                                        .then((value) {
                                      Alerts.showMessage(
                                          "This item has been successfuly deleted!",
                                          context);
                                      Navigator.pop(context);

                                      setState(() {
                                        getCart();
                                      });
                                    });
                                  },
                                  context: context,
                                  onPressNo: () {
                                    Navigator.pop(context);
                                  },
                                  content:
                                      'Are you sure you want to delete this item?',
                                  title: 'Delete item',
                                );
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),

                        // qty
                        Text(
                          "Quantity : ${listCart[index].quantity!}",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        // price label
                        Text(
                          "Price : " +
                              CurrencyMoney.indRupiah.format(
                                  int.parse(listCart[index].priceProduct!)),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        // edit button and price
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
                                        idProduct: listCart[index].idProduct!,
                                        editCart: true,
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
                                  int.parse(listCart[index].priceProduct!) *
                                      int.parse(listCart[index].quantity!),
                                ),
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
      },
    );
  }
}
