import 'package:flutter/material.dart';
import 'package:eleteme/models/NewsModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:eleteme/Database/DatabaseHelper.dart';
class Article extends StatefulWidget {
  final News news ;
  Article({Key key, @required this.news}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _Article();
  }
}

class _Article extends State<Article> {
  IconData icon=Icons.star_border;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.network(
          widget.news.urlToImage,
          fit: BoxFit.fitWidth,
        ),
        Text(
          widget.news.title,
          style: TextStyle(fontSize: 20.0, color: Colors.blue),
        ),
        IconButton(icon: Icon(icon),onPressed: (){
          setState(() {
            if(icon!=Icons.star){
                      icon=Icons.star;
                      _saveData(widget.news);
                    }
                    else{
                      icon=Icons.star_border;
                      _deleteData(widget.news);
                    }});
        },),
        Text(widget.news.description),
        Row(children: <Widget>[Text(widget.news.publishedAt), Text(widget.news.author)],mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
        InkWell(onTap: (){
          launch(widget.news.url);
        },child: Text("go to Articel",style: TextStyle(color:Colors.blue),),)
      ],
    )));
  }
  _saveData(News news)async{
var db =new DatabaseHelper();
int savedUser =await db.addNewsItem(news);
print(savedUser);
  }
    _deleteData(News news)async{
var db =new DatabaseHelper();
int savedUser =await db.deleteNews(news.url);
print(savedUser);
  }
}
