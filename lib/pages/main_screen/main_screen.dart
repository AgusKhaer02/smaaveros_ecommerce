import 'package:ecommerce/constants/font_constants.dart';
import 'package:ecommerce/pages/auth/login/login.dart';
import 'package:ecommerce/pages/cart_screen/cart_screen.dart';
import 'package:ecommerce/pages/help_screen/help_screen.dart';
import 'package:ecommerce/pages/main_screen/subscreen/about/about.dart';
import 'package:ecommerce/pages/main_screen/subscreen/feed/feed.dart';
import 'package:ecommerce/pages/main_screen/subscreen/help/help.dart';
import 'package:ecommerce/pages/main_screen/subscreen/home/home.dart';
import 'package:ecommerce/utils/login_pref.dart';
import 'package:flutter/material.dart';
import 'package:need_resume/need_resume.dart';

import '../profile_screen/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLogin = false;

  checkPref(){
    LoginPref.checkPref().then((value) {
      setState((){
        isLogin = value;
      });
    });
  }

  @override
  void initState() {
    checkPref();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Ecommerce",
            style: FontConstants.headerTitle,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );

              },
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
            ),

            // menampilkan list menu item
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              itemBuilder: (itmcontext) => [
                //profile
                // cek apakah user sudah login?

                (isLogin == true)
                // jika sudah, maka tampilkan menu item my profile
                    ? PopupMenuItem<int>(
                  value: 0,
                  child: Text("My Profile"),
                )
                // jika tidak, tetap tampilkan menu tapi kosong childnya
                    : PopupMenuItem(value: 0,child: Text("Login")),

              ],
              onSelected: (item) {
                switch (item) {
                  case 0:
                    if(isLogin){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ProfileScreen())).then((value) {
                        checkPref();
                      });
                      return ;
                    }

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Login())).then((value) {
                      checkPref();
                    });
                    break;

                  default:

                    break;
                }
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Home(),
            FeedScreen(),
            HelpScreen(),
            AboutPage(),
          ],
        ),
        bottomNavigationBar: TabBar(
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.orange,
          tabs: [
            Tab(
              icon: Icon(Icons.home_outlined),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.feed_outlined),
              text: "Feeds",
            ),
            Tab(
              icon: Icon(Icons.help_outline_outlined),
              text: "Help",
            ),
            Tab(
              icon: Icon(Icons.person_outline_outlined),
              text: "About",
            ),
          ],
        ),
      ),
    );
  }
}
