import 'package:flutter/material.dart';

class ListUser extends StatefulWidget {
  const ListUser({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  // List<String> users = ['User 1', 'User 2', 'User 3'];

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
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return const ListTile(
                title: Text('buton'),
                subtitle: Text('aaa'),
                leading: CircleAvatar(
                  backgroundColor: Color.fromRGBO(90, 14, 39, 1),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}



























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