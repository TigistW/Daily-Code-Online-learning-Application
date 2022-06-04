import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobile_app/user/usermodel/user.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  String url = "http://localhost:8080/allUsers";

  Future<List<User>> save() async {
    final res = await http.get(
      Uri.parse(url),
    );
    var responseData = json.decode(res.body);

    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
          email: singleUser["email"],
          firstname: singleUser["firstname"],
          lastname: singleUser["lastname"],
          password: singleUser["password"],
          role: singleUser["role"]);

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User List"), actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            context.go("/adduser");
          },
        ),
      ]),
      body: FutureBuilder(
        future: save(),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (ctx, index) => Card(
                child: ListTile(
                  leading: FlutterLogo(),
                  title: Text(snapshot.data[index].firstname),
                  subtitle: Text(snapshot.data[index].role),
                  trailing: Icon(Icons.delete_forever_sharp),
                  // contentPadding: EdgeInsets.all(10.0),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
