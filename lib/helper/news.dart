import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:MakeNewsDemoApp/constant.dart';
import 'package:MakeNewsDemoApp/models/article_model.dart';

/// All news - general
///
/// Returns list of news
class News {
  List<ArticleModel> news  = [];

  Future<void> getNews() async {
    // API URl
    String url = "http://newsapi.org/v2/top-headlines?country=ph&apiKey=${apiKey}";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    // check response status
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        // check image and description to display
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}

/// News per Category
///
/// Returns list of news per category
class NewsForCategories {
  List<ArticleModel> news  = [];

  Future<void> getNewsForCategory(String category) async {
    String url = "http://newsapi.org/v2/top-headlines?country=ph&category=${category}&apiKey=${apiKey}";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        /// check image and description to display
        if (element['urlToImage'] != null && element['description'] != null) {
          /// 
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}