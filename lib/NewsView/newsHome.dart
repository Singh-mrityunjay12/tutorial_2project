// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_practice3/NewsView/widgets/newsContainer.dart';
import 'package:flutter_practice3/controller/fetchNews.dart';
import 'package:flutter_practice3/model/newsModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NewsArt newsArt;
  GetNews() async {
    newsArt = await FetchNews.fetchNews();
    setState(() {});
  }

//initState() function me ham async and await use nahi kar skate
  @override
  void initState() {
    // TODO: implement initState
    GetNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            controller: PageController(initialPage: 0),
            scrollDirection: Axis.vertical,
            onPageChanged: (value) {
              GetNews();
            },
            itemBuilder: (context, index) {
              return NewsContainer(
                  imgUrl: newsArt.imgUrl.toString(),
                  newsHead: newsArt.newsHead.toString(),
                  newsDes: newsArt.newsDes.toString(),
                  newscnt: newsArt.newsCnt.toString(),
                  newsUrl: newsArt.newsUrl.toString());
            }));
  }
}
