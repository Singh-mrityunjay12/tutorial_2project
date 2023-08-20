class NewsArt {
  String? imgUrl;
  String? newsHead;
  String? newsDes;
  String? newsCnt;
  String? newsUrl;

//create constructor
  NewsArt(
      {required this.imgUrl,
      required this.newsCnt,
      required this.newsDes,
      required this.newsHead,
      required this.newsUrl});

  static NewsArt fromAPItoApp(Map<String, dynamic> article) {
    return NewsArt(
        imgUrl: article["urlToImage"] ??
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dreamstime.com%2Fphotos-images%2Fnews.html&psig=AOvVaw37Q4R4lD-oAHqR9Rl0gUNM&ust=1691677261137000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCPiX2YTjz4ADFQAAAAAdAAAAABAE",
        newsCnt: article["content"] ?? "--",
        newsDes: article["description"] ?? "--",
        newsHead: article["title"] ?? "--",
        newsUrl: article["url"] ??
            "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en");
  }
}
