import 'package:ecommerce/api/api.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../../../utils/currency_money.dart';
import '../../../utils/login_pref.dart';

class Footer extends StatefulWidget {
  final List<Map<String, String>> cartList;
  final int totalPrice;

  const Footer({
    Key? key,
    required this.cartList, required this.totalPrice,
  }) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  String message = "", username = "";
  String? phoneNumber = "";
  TextEditingController noteController = TextEditingController();

  getNumberPhone() {
    var number = Api.getAbout();
    number.then((value) {
      setState((){
        phoneNumber = value.data!.contact;
      });

    });
  }
  // mengambil username dari pref
  // ini untuk nama
  getUsername() {
    LoginPref.getValuePref().then((value) async {
      username = value['username']!;
    });
  }

  launchWhatsapp() async {
    await getUsername();
    setMessage();
    final link = WhatsAppUnilink(
      phoneNumber: phoneNumber,
      text: message,
    );
    await launch('$link');
  }

  setMessage(){
    message += "Permisi, saya ${username}, saya ingin membeli produk dibawah ini \n";
    List.generate(widget.cartList.length, (index) {
      message += "----------------- \n" +
          "Nama produk : ${widget.cartList[index]["productName"]} \n" +
          "Harga satuan : ${widget.cartList[index]["price"]} \n" +
          "qty : ${widget.cartList[index]["quantity"]} \n" +
          "----------------- \n\n";
    });
    message += "*TOTAL : ${CurrencyMoney.indRupiah.format(widget.totalPrice)}* \n";
    message += "Note : ${noteController.text}";
  }

  @override
  void initState() {
    getNumberPhone();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // write notes
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 0.5,
                blurRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            maxLines: 3,
            controller: noteController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Leave a note here...",
            ),
          ),
        ),

        // total price
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            children: [
              Text("TOTAL : "),
              Text(
                CurrencyMoney.indRupiah.format(widget.totalPrice),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        // checkout button
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            onPressed: () {
              launchWhatsapp();
            },
            child: Text(
              "Checkout",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            // style: ,
          ),
        )
      ],
    );
  }
}
