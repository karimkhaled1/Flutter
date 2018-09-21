import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:eleteme/models/NewsModel.dart';

class DatabaseHelper {
  final String _newsTable = "newsTable";
  final String _title = "title";
  final String _des = "description";
  final String _url = "url";
  final String _urlToImage = "urlToImage";
  final String _author = "author";
  final String _publishedAt = "publishedAt";
  final String _content = "content";

  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'notes.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $_newsTable($_url text PRIMARY KEY, $_title TEXT, $_des TEXT, $_content TEXT, $_urlToImage TEXT, $_publishedAt TEXT, $_author TEXT)');
  }

  Future<int> addNewsItem(News news) async {
    var dbClinet = await db;
    int res = await dbClinet.insert(_newsTable, news.toMap());
    return res;
  }

  Future<List> getAllNews() async {
    var dbClinet = await db;
    var res = await dbClinet.rawQuery("SELECT * from $_newsTable");
    print(res);
  List<News> news = new List();
    res.forEach((result) {
      News article = News.fromMap(result);
      news.add(article);
    });
    return news;
  }

  Future<int> deleteNews(String urll) async {
    var dbClinet = await db;
    var res = await dbClinet
        .delete(_newsTable, where: "$_url = ?", whereArgs: [urll]);
    return res;
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close;
  }
}
