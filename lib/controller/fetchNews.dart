import 'dart:convert';
import 'dart:math';

import 'package:flutter_practice3/model/newsModel.dart';
import 'package:http/http.dart';

class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];
  static Future<NewsArt> fetchNews() async {
    //for select random element
    final _random = new Random();
    var element = sourcesId[_random.nextInt(sourcesId.length)];
    print(element);

    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$element&apiKey=60500ecfc6da46e1aab9d033692ae205"));

    Map body_data = jsonDecode(response.body);
    List artical = body_data["articles"];

    print("88888888888888888888888888888888888888");

    // print(artical); //give list of the article element
    final _Newrandom = new Random();
    var myArtical = artical[_random.nextInt(artical.length)];
    print(myArtical); //give only one element of the article
    print("8888888888888888888888888888888888888888");
    return NewsArt.fromAPItoApp(myArtical);
  }
}
