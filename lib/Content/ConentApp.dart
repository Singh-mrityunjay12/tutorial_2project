import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContentApp extends StatefulWidget {
  const ContentApp({Key? key}) : super(key: key);

  @override
  State<ContentApp> createState() => _ContentAppState();
}

class _ContentAppState extends State<ContentApp> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int _currentIndex = 0;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 70),
        color: Color(0xFFc5e5f3),
        child: Column(
          children: [
            Container(
              width: width,
              height: 100,
              margin: EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFebf8fd),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        "images/Earth.jpg",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "James Smith",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          "Top level",
                          style: TextStyle(color: Colors.yellowAccent),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Icon(
                      Icons.notification_important,
                      color: Colors.teal,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
