import 'package:deneme/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String username;
  late String password;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelText: "Kullanici Adi",
                  labelStyle: TextStyle(color: Colors.red),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "kullanici adi giriniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  username = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelText: "şifre",
                  labelStyle: TextStyle(color: Colors.red),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "şifre giriniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  password = value!;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(child: const Text("Üye ol"), onPressed: () {}),
                  MaterialButton(
                      child: const Text("Şifremi Unuttum"), onPressed: () {}),
                ],
              ),
              _loginButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton() => ElevatedButton(
        child: const Text("giriş yap"),
        onPressed: () {
          if (_formkey.currentState!.validate()) {
            _formkey.currentState!.save();
            // Navigator.pushNamed(context, "/homepage");

            // debugPrint("usename : $username , password: $password");
            if (username == "BARETTA" && password == "hasan") {
              debugPrint("giriş başarili");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(username: username),
                ),
              );
            } else {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Hata"),
                      content: const Text("Giriş bilgileriniz hatalı"),
                      actions: <Widget>[
                        MaterialButton(
                            child: const Text("Geridön"),
                            onPressed: () {
                              Navigator.pushNamed(context, "/");
                            })
                      ],
                    );
                  });
            }
          }
        },
      );
}
