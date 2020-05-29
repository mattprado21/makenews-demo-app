import 'package:http/http.dart' as http;
import 'package:MakeNewsDemoApp/models/article_model.dart';
import 'dart:convert';

import 'package:MakeNewsDemoApp/constant.dart';

class News {
  List<ArticleModel> news  = [];

  Future<void> getNews() async {
    String url = "http://newsapi.org/v2/everything?q=bitcoin&from=2020-04-29&sortBy=publishedAt&apiKey=1f4567e03b4c4ff3988c9751f0277118";

    // String url = "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=${apiKey}";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element){

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


class NewsForCategories {
  List<ArticleModel> news  = [];

  Future<void> getNewsForCategory(String category) async{
    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    String url = "http://newsapi.org/v2/everything?q=bitcoin&from=2020-04-29&sortBy=publishedAt&apiKey=1f4567e03b4c4ff3988c9751f0277118";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {

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