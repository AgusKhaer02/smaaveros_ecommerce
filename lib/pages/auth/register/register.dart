import 'package:ecommerce/api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //email, username, password
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  register(BuildContext context) {
    Api.register({
      "email": txtEmail.text,
      "username": txtUsername.text,
      "password": txtPassword.text,
    }).then((value) {
      // Utils.showMessage("Register Successfully!", context);
      // move to login after register
      Navigator.of(context).pop();
    }).catchError((msgError) {
      // Utils.showMessage("Register Failed", context);
      showToast(msgError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Register Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  width: 200,
                  height: 150,
                  child: Image.asset('assets/logo2.png'),
                ),
              ),
            ),

            // email
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: txtEmail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter valid email id as abc@gmail.com',
                ),
              ),
            ),

            // username
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 15,
                bottom: 0,
              ),
              child: TextField(
                controller: txtUsername,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),

            // password
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 15,
                bottom: 0,
              ),
              child: TextField(
                obscureText: true,
                controller: txtPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                ),
              ),
            ),

            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FlatButton(
                onPressed: () {
                  //lakukan aksi pendaftaran
                  register(context);
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Text('New User? Create Account'),
          ],
        ),
      ),
    );
  }
}
