import 'package:ecommerce/pages/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void delayed(BuildContext context) {
    //jeda dulu 3 detik
    Future.delayed(Duration(seconds: 3), () {
      // setelah jeda
      // pindah ke halaman home page dan menghapus halaman ini
      // sehingga ketika di hapus, tidak bisa kembali lagi he halaman splashscreen

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
              (route) => false);

    });
  }

  @override
  Widget build(BuildContext context) {
    // dijeda beberapa detik
    delayed(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/logo_e_commerce.png",
              width: 200,
              height: 200,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
