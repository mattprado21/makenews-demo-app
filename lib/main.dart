import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List articleData;

  Future<String> getData() async {
    // var url = "http://localhost:8080/articles";
    var url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(
      Uri.encodeFull(url),
      headers: {
        "Accept": "application/json"
      }
    );

    setState(() {
      articleData = json.decode(response.body);
    });

    return "Success!";
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make News Demo App'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: articleData == null ? 0 : articleData.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(5.0),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(
                      articleData[index]['title'],
                      style: TextStyle(fontSize: 20.0, color: Colors.blue),
                    ),
                    subtitle: Text(
                      articleData[index]['body'],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: false,
                      ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleContent()));
                    }
                  ),
                ),
              ),
            );
          },
        ),
      )
    );
  }
}

class ArticleContent extends StatelessWidget {
  // for getting the content ot the article article
  // final Article article;
  // ArticleContent(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(article.title),
        title: Text("Title"),
      ),
      body: Text("This is a body"),
    );
  }
}

class Article {
  final int id;
  final String title;
  final String body;
  // final String picture;
  // final String publishedDate;

  Article(this.id, this.title, this.body);

  // Article(this.id,this.title,this.body,this.picture, this.publishedDate);
}