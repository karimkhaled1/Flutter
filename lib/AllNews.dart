import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eleteme/models/NewsModel.dart';
import 'package:eleteme/Article.dart';

class allNews extends StatelessWidget {
  List<News> news = List();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData(),
      builder: (context, data) {
        return ListView.builder(
          itemCount: news.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(onTap: (){
               Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Article(news: news[index],)),
            );
            },
                title: Text(news[index].title),leading: Image.network(news[index].urlToImage,height: 80.0,width: 80.0,),
               );
          },
        );
      },
    );
  }

  _getData() async {
    String apiKey = '2b211dc3274a4dfa96eb88676ca7830c';
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=" + apiKey;
    var response = await http.get(url);
    //  print(response.statusCode);

    if (response.statusCode == 200) {
      //   print("SDf");
      var s = News.fromJson(json.decode(response.body));
      //  print("zzzzzzzzzzzzz");
      news = s;
      //  print(news);
      //  print(news.length);
      return s;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
