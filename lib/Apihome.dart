import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class ApiHomeScreen extends StatefulWidget {
  const ApiHomeScreen({Key? key}) : super(key: key);

  @override
  State<ApiHomeScreen> createState() => _ApiHomeScreenState();
}

class _ApiHomeScreenState extends State<ApiHomeScreen> {
  var user = [];
  @override
  void initState() {
    // Future<void> getuserData() async {
    //   try {
    //     http.Response resp = await http
    //         .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    //     user = jsonDecode(resp.body)[0]['name'];
    //   } catch (err) {
    //     print(err.toString());
    //   }
    // }
    getuserData();
    super.initState();
  }

  Future<void> getuserData() async {
    try {
      http.Response resp = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      // print(jsonDecode(resp.body)[0]['name']);
      setState(() {
        user = jsonDecode(resp.body);
      });
    } catch (err) {
      print(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: user.length > 0
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: Text(user[index]['name']),
                    subtitle: Text(user[index]['email']),
                    trailing: Text(user[index]['address']['street']),
                  ));
                },
                itemCount: user.length,
              )
            : Center(child: CircularProgressIndicator())
        // Center(
        // child: ElevatedButton(
        // onPressed: getuserData,
        // () async {
        //now use await and async method to access the data
        //and in this method find error by using try and catch method jisame error ayega usako
        //ham try ke inside me rakhenge
        // try {
        //   http.Response resp = await http
        //       .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

        //   print(jsonDecode(resp.body)[0]['name']);
        // } catch (err) {
        //   print(err.toString());
        // }
        // http.Response resp = await http
        //     .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

        // print(jsonDecode(resp.body)[0]['name']);

        // .then((res) => print(res.body.runtimeType));
        // .then((value) => print(jsonDecode(value.body)[0]['name']))
        //fetch the data
        //  asynchronously only use with then and catchError method
        //without using await and async method
        //     .catchError((err) {
        //   print(err.toString());
        // });
        // },
        // child: Text("test")),
        // )
        );
  }
}
