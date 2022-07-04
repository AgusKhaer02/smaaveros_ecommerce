import 'package:ecommerce/api/product/DetailProductResponse.dart';
import 'package:ecommerce/pages/detail_product_screen/widgets/description.dart';
import 'package:ecommerce/pages/detail_product_screen/widgets/detail_product_item.dart';
import 'package:ecommerce/pages/detail_product_screen/widgets/footer.dart';
import 'package:flutter/material.dart';

import '../../api/api.dart';
import '../../api/cart/check_cart_response.dart';
import '../../utils/alerts.dart';
import '../../utils/login_pref.dart';

class DetailProductScreen extends StatefulWidget {
  final String idProduct;
  final bool editCart;

  const DetailProductScreen(
      {Key? key, required this.idProduct, this.editCart = false})
      : super(key: key);

  @override
  _DetailProductScreenState createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  // pada halaman ini untuk menampilkan datanya tidak berasal dari data snapshot,
  // melainkan dari variable2 yang terdeklarasikan di bawah ini.
  // hal ini dikarenakan masih mencari referensi terkait Future Builder yang seharusnya
  // dilakukan sekali ketika halaman di panggil

  late Future<DetailProductResponse>? detailProduct;
  late Future<CheckCartResponse> checkCart;
  late String idUser;
  bool? isCartAvailable;

  // data product detail
  String idProduct = "";
  String nameProduct = "";
  String nameCategory = "";
  String descProduct = "";
  String imageProduct = "";
  String stockProduct = "";
  int priceProduct = 0;
  int totalPrice = 0;
  int status = 0;
  String response = "";
  int itemCount = 1;

  // # data product detail

  // untuk mencegah getdata berulang ulang ketika halaman di render ulang dengan setState()
  // triggernya ada di bagian then FutureBuilder
  bool stopRefreshing = false;

  checkCartUser() {
    LoginPref.getValuePref().then((value) async {
      if (value['id_user'] == null) {
        setState(() {
          isCartAvailable = false;
          itemCount = 1;
        });
        return ;
      }
      // ambil id user
      idUser = await value['id_user']!;

      // cek apakah ada item di keranjang?
      // masukan iduser dan idproduct
      checkCart = Api.checkCart(idUser, widget.idProduct);

      // ketika sudah ada data, maka atur itemCount sesuai dengan..
      // jumlah item product yang ada di webservice
      checkCart.then((value) {
        setState((){
          // cek apakah mengandung nilai null atau tidak
          // tidak null = true
          // null = false
          isCartAvailable = (value != "null") ? true : false;

          // update variabel item countnya
          itemCount = int.parse(value.result!.quantity!);
        });
      });


    });
  }

  @override
  void initState() {
    //  ini sebetulnya bisa ditambahkan di luar function,
    //  kenapa didalam? karena terdapat perintah yang tidak dapat diekseskusikan di dalam function,
    //  widget.id contohnya
    detailProduct = Api.getDetailProduct(widget.idProduct);
    checkCartUser();
    super.initState();
  }

  Widget loadingData() {
    return FutureBuilder(
      future: detailProduct,
      builder: (context, AsyncSnapshot<DetailProductResponse> snapshot) {
        if (isCartAvailable != null) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            // ketika sudah bisa mengambilan data, tidak bisa melakukan loading lagi sampai user melakukan refresh dengan swipe
            stopRefreshing = true;

            // masuk ke masing2 variabel
            idProduct = snapshot.data!.idProduct!;
            nameProduct = snapshot.data!.nameProduct!;
            nameCategory = snapshot.data!.nameCategory!;
            descProduct = snapshot.data!.descProduct!;
            imageProduct = snapshot.data!.imageProduct!;
            stockProduct = snapshot.data!.stockProduct!;
            priceProduct = int.parse(snapshot.data!.priceProduct!);
            status = snapshot.data!.status!;
            response = snapshot.data!.response!;
            totalPrice = int.parse(snapshot.data!.priceProduct!);

            return showDetail();
          }
          else if (snapshot.hasError) {
            stopRefreshing = false;
            return Center(
              child: Text("Data is unavailable, please check your connection"),
            );
          }
        }

        stopRefreshing = false;
        return Center(child: CircularProgressIndicator());

      },
    );
  }

  Widget showDetail() {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Container(
      width: maxWidth,
      height: maxHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          Image.network(
            imageProduct,
            height: 300,
            width: double.infinity,
          ),
          SizedBox(
            height: 10,
          ),

          // info name,category,stock,price
          DetailProductItem(
            descProduct: descProduct,
            priceProduct: priceProduct,
            nameProduct: nameProduct,
            stockProduct: stockProduct,
            nameCategory: nameCategory,
          ),

          SizedBox(
            height: 10,
          ),

          Description(
            desc: descProduct,
            nameProduct: nameProduct,
          ),

          // add / remove item
          setQuantity(),
          SizedBox(
            height: 10,
          ),
          (widget.editCart)
              ? Center(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: () {
                  // // aksi ubah keranjang
                  // // data yang dibutuhkan adalah : iduser, idproduct, dan qty
                  Api.updateCart({
                    "id_user": idUser,
                    "id_product": idProduct,
                    "quantity": itemCount.toString(),
                  }).then((value) {
                    // ketika sudah selesai ubah, muncul pesan dalam bentuk toast
                    Alerts.showMessage(
                        "Your item is changed successfully!", context);
                    // kalo sudah, reload halaman
                    setState(() {});
                  });
                },
                child: Text("Edit cart"),
              ),
            ),
          )
              : SizedBox(),

          // expanded yang ini supaya bisa mendorong si footer ke bawah
          Expanded(
            child: SizedBox(),
          ),

          // footer ini yang akan menampilkan total harga, tombol submit,add to cart, dan go to cart
          Footer(
            totalPrice: totalPrice,
            editCart: widget.editCart,
            idProduct: widget.idProduct,
            qty: itemCount,
          ),
        ],
      ),
    );
  }

  Widget setQuantity() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // kurangi jumlah barang
          ElevatedButton(
            onPressed: () {
              setState(() {
                // proses decrement/pengurangan
                itemCount--;
                // kondisi ini akan mencegah adanya nilai negatif pada variabel itemCount
                if (itemCount <= 0) {
                  itemCount = 1;
                }
                // membuat total dari berapa item yang akan dimasukan ke dalam cart
                totalPrice = priceProduct * itemCount;
              });
            },
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(), primary: Colors.grey[200]),
            child: Icon(
              Icons.horizontal_rule,
              size: 20,
            ),
          ),

          // untuk menampilkan berapa jumlah barang
          Text(
            itemCount.toString(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          // tambahkan jumla barang
          ElevatedButton(
            onPressed: () {
              setState(() {
                itemCount++;
                totalPrice = priceProduct * itemCount;
              });
            },
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(), primary: Colors.green[400]),
            child: Icon(
              Icons.add,
              size: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (stopRefreshing == false) ? loadingData() : showDetail(),
      ),
    );
  }
}
