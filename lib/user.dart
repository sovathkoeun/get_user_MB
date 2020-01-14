
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List users;
  Map datas;
  Future setUser() async {
    String url = "https://reqres.in/api/users";
    http.Response response = await http.get(url);
    // debugPrint(response.body);
    datas =  json.decode(response.body); 
    setState(() {
    //  users = json.decode(response.body); 
    users = datas["data"];
    });
  }
  @override
  void initState() {
    super.initState();
    setUser();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[900],
     appBar: AppBar( 
       backgroundColor: Colors.blue,
       title: Text("User Information"),
     ),
     body: ListView.builder(  
       itemCount: users == null ? 0 : users.length,
       itemBuilder: (BuildContext context, int i) {
         return Card (         
          //  child: Text("${users[i]["name"]}"),
          child: Container( 
            padding: EdgeInsets.all(20.0),          
            child: Row(              
              children: <Widget>[          
                CircleAvatar(  
                  backgroundImage: NetworkImage(users[i]["avatar"]),           
                ),
                 Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Text("${users[i]["first_name"]}"),
                 ),
              ],
            ),
          ),
         );
       }
     ),
    );
  }
}