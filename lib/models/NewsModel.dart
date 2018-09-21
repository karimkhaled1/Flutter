class News {
  final String author;
  final String description;
  final String urlToImage;
  final String title;
  final String url;
  final String publishedAt;
  final String content;

  News(
      {this.url,
      this.content,
      this.publishedAt,
      this.author,
      this.urlToImage,
      this.title,
      this.description});

  static fromJson(Map<String, dynamic> json) {
    List<News> news = List();
    // print("ASDf");
    for (int i = 0; i < json['totalResults']; i++) {
      News n = News(
        author: json['articles'][i]['author'],
        description: json['articles'][i]['description'],
        urlToImage: json['articles'][i]['urlToImage'],
        title: json['articles'][i]['title'],
        url: json['articles'][i]['url'],
        publishedAt: json['articles'][i]['publishedAt'],
        content: json['articles'][i]['content'],
      );
      if (n.urlToImage != null) {
        news.add(n);
      }
    }
    return news;
  }
  Map<String ,dynamic> toMap(){
    var map =Map<String,dynamic>();
    map['title']=title;
    map['description']=description;
    map['url']=url;
    map['urlToImage']=urlToImage;
    map['author']=author;
    map['content']=content;
    map['publishedAt']=publishedAt;
    return map;
  }

  static fromMap(Map<String, dynamic> json) {
      News n = News(
        author: json['author'],
        description: json['description'],
        urlToImage: json['urlToImage'],
        title: json['title'],
        url: json['url'],
        publishedAt: json['publishedAt'],
        content: json['content'],
      );
    return n;
  }}