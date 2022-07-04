import 'package:ecommerce/api/api.dart';
import 'package:ecommerce/utils/login_pref.dart';
import 'package:flutter/material.dart';

import '../../../utils/alerts.dart';
import '../register/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isVisible = true;

  void setLogin(String email, String password, BuildContext context) {

    // masukkan nilai email dan password dan dibungkus dalam bentuk map
    var data = {
      "email": email,
      "password": password,
    };

    // panggil function login kemudian masukan data yg ada divariabel data ke function login
    Api.login(data).then((value) async {
      // jika hasil login berhasil
      if (value.message == "login user successful") {
        // ketika berhasil, webservice ini akan merespon nilai id user dan username
        // maka masukan nilai response username dan iduser ke sharedpref
        LoginPref.saveToSharedPref(
            value.result!.idUser!, value.result!.username!);

        // cek pref, jika nilainya true, maka pindah ke
        //  halaman sebelumnya
        if (await LoginPref.checkPref() == true) {
          Navigator.of(context).pop();
          LoginPref.getValuePref().then((value) {
            print(value);
          });
        }
      } else {
        // jika login tidak sukses muncul error dibawah
        Alerts.showMessage("Invalid Email and Password", context);
      }
    }).catchError((msgError) {
      // ini untuk alasan sebenarnya mengapa error,
      // error bisa jadi karna : tidak ada koneksi, salah webservice, server error, dst
      print(msgError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //picture
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/logo_e_commerce.png'),
                  ),
                ),
              ),

              Center(
                child: Text("Anda harus login dulu"),
              ),

              SizedBox(
                height: 20,
              ),

              // email text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email as abc@gmail.com',
                  ),
                ),
              ),

              // password text
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  top: 15,
                  bottom: 0,
                ),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: isVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          // input nilai yang berlawanan dengan nilai pada isVisible
                          // contoh isVisible bernilai true akan di input dengan nilai false,
                          // begitu juga sebaliknya
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon((isVisible)
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              //login button
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setLogin(_emailController.text, _passwordController.text,
                        context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),

              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return Register();
                  }));
                },
                child: Text("Don't have an account? Sign Up here!",style: TextStyle(
                    color: Colors.grey
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
