import 'package:flutter/material.dart';
import 'package:eleteme/Database/DatabaseHelper.dart';
import 'package:eleteme/models/NewsModel.dart';
import 'Article.dart';

class favoriate extends StatelessWidget {
  List<News> news = List();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData(),
      builder: (context, data) {
        return ListView.builder(
          itemCount: news.length,
          itemBuilder: (BuildContext c, int index) {
            print(news[index].urlToImage);
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Article(
                            news: news[index],
                          )),
                );
              },
              title: Text(news[index].title),
             leading: Image.network(news[index].urlToImage,height: 80.0,width: 80.0,)
            );
          },
        );
      },
    );
  }

  _getData() async {
    var db = new DatabaseHelper();
    news = await db.getAllNews();
    print(news);
  }
}
