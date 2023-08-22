import 'package:http/http.dart';

import 'package:flutter/material.dart';

import 'model.dart';

class ListUser extends StatefulWidget {
  const ListUser({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  // List<String> users = ['User 1', 'User 2', 'User 3'];
  //http://127.0.0.1:8000/api/categoryList
  // 10.16.3.113/api/userList

  final url = Uri.parse('http://10.0.2.2:8000/api/userList');
  var counter = 0;
  // ignore: prefer_typing_uninitialized_variables
  var usersResult;

  Client http = Client();

  Future callUsers() async {
    try {
      final response = await http.get(url);
      // print(response.body);
      if (response.statusCode == 200) {
        var result = usersFromJson(response.body);
        if (mounted) {
          setState(() {
            counter = result.users.length;
            usersResult = result;
          });
          return result;
        }
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    callUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kullanıcı Listesi'),
        backgroundColor: const Color.fromRGBO(117, 183, 229, 1),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              itemCount: counter,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical:
                          10), // İstediğiniz boşluk değerini ayarlayabilirsiniz
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white, // Kutunun arka plan rengi
                    borderRadius:
                        BorderRadius.circular(10), // Kutu kenar yuvarlatması
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Gölge rengi
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // Gölge konumu
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(usersResult.users[index].username),
                    subtitle: Text(usersResult.users[index].userTitle),
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromRGBO(117, 183, 229, 1),
                      child: Text(
                        usersResult.users[index].id.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(117, 183, 229, 1),
        onPressed: () {
          callUsers();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}










// http://127.0.0.1:8000/api/userList
// get Request
// get post put delete
















//  import 'package:flutter/material.dart';

//  class ListUser extends class ListUser extends StatefulWidget {
//    const ListUser({super.key});
 
//    @override
//    State<ListUser> createState() => _ListUserState();
//  }
 
//  class _ListUserState extends State<ListUser> {
//    @override
//    Widget build(BuildContext context) {
//      return Container();
//    }
//  }