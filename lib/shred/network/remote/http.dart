import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news/models/news_model.dart';

class GetNews {

  List<Article> newsList = [];

  void getNews() async {

    var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&category=science&apiKey=aa565603ab594eac968d86565d6e90e8');
    var response = await http.get(url);

    if (response.statusCode == 200) {

      var body = response.body;
      var data = jsonDecode(body);

      for (var item in data['articles']) {
        newsList.add(Article(
          title: item['title'].toString(),
          url: item['url'].toString(),
          publishedAt: item['publishedAt'].toString(),
          description: ['description'].toString(),
          urlToImage: item['urlToImage'].toString(),
        ));
      }

    }

  }

}