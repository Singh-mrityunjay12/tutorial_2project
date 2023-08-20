import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_practice3/NewsView/detail_view.dart';

class NewsContainer extends StatelessWidget {
  late String imgUrl;
  late String newsHead;
  late String newsDes;
  late String newsUrl;
  late String newscnt;
  NewsContainer(
      {required this.imgUrl,
      required this.newsHead,
      required this.newsDes,
      required this.newsUrl,
      required this.newscnt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
              height: 400,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              imgUrl),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsHead,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  newsDes,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  newscnt.length > 400
                      ? newscnt.substring(0, 400)
                      : "${newscnt.toString().substring(0, newscnt.length - 15)}...",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                      onPressed: () {
                        print("GOING TO $newsUrl");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailViewScreen(new_Url: newsUrl)));
                      },
                      child: Text("Read More")))
            ],
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    ));
  }
}
