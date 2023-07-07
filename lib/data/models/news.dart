class NewsModel {
  String? status;
  int? totalResults;
  List? articles;

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = json['articles'].map((i) => Article.fromJson(i)).toList();
    }
  }
}

class Article {
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;

  Article.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
  }
}