import 'package:flutter/material.dart';

class KayitOl extends StatefulWidget {
  const KayitOl({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _KayitOlState();
}

// ignore: unused_element
class _KayitOlState extends State<KayitOl> {
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
            Navigator.pushNamed(context, "/");

            // debugPrint("usename : $username , password: $password");
          }
        },
      );
}
