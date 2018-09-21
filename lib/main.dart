import 'package:flutter/material.dart';
import 'package:eleteme/AllNews.dart';
import 'package:eleteme/favorate.dart';
import 'package:eleteme/more.dart';
void main() => runApp(new MainApp());
class MainApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyApp();
  }
  
}
class MyApp extends State<MainApp> {
  List<Widget> _widgets=[allNews(),favoriate(),more()];
  List<String> _titles=['search','favorites','more'];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(appBar: AppBar(centerTitle: true,title:Text( _titles[_currentIndex],)),body:_widgets[_currentIndex] ,
      bottomNavigationBar: BottomNavigationBar(currentIndex: _currentIndex,onTap: (index){
        setState(() {
                  _currentIndex=index;
                });
      },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("search"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("favorites"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            title: Text("more"),
          )
        ],
      ),
    ));
  }
}
