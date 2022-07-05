import 'package:ecommerce/api/about/AboutResponse.dart';
import 'package:ecommerce/api/api.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Future<AboutResponse> getAbout = Api.getAbout();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAbout,
      builder: (context, AsyncSnapshot<AboutResponse> snapshot) {
        if (snapshot.hasData) {
          return showAbout(snapshot.data!);
        }else if(snapshot.hasError){
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

  Stack showAbout(AboutResponse data) {
    return Stack(
      children: [
        Image.network(
          "https://cdn.wallpapersafari.com/35/61/bFJRnp.jpg",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black45,
          ),
        ),
        Positioned(
            top: 40,
            left: 0,
            bottom: 0,
            right: 0,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Ecommerce Averos",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Text(data.data?.appDesc ?? "Kosong"),
                    ],
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/logo_e_commerce.png"),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
