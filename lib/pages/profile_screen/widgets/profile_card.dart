import 'package:ecommerce/utils/alerts.dart';
import 'package:ecommerce/utils/login_pref.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  String username = "";

  logout(BuildContext context) {
    LoginPref.removePref().then((value) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    });
  }

  @override
  void initState() {
    LoginPref.getValuePref().then((value) {
      setState(() {
        username = value['username']!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      decoration: BoxDecoration(
        color: Color(0xFFF8FEFE),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 1),
        ],
      ),
      child: Column(
        children: [
          // gambar,nama,jabatan,follower,article,following
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "https://www.theportlandclinic.com/wp-content/uploads/2019/07/Person-Curtis_4x5-e1564616444404-300x300.jpg",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("IT Trainer/Developer"),
                  ],
                ),
              )
            ],
          ),
          // tombol chat dan follow
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text("Chat"),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                        Alerts.showAlertYesNo(
                          title: "Logout",
                          content: "Apakah anda ingin logout?",
                          onPressYes: () {
                            logout(context);
                          },
                          onPressNo: () {
                            Navigator.pop(context);
                          },
                          context: context,
                        );
                  },
                  child: Text("Logout"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
