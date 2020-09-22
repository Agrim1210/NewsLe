import 'dart:convert';



import 'package:NewsLe/models/aritcle_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    String url =
     'http://newsapi.org/v2/top-headlines?country=in&apiKey=0c334555e9a24ec8a1e40ad1dd30763b';
     

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null || element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            // publishedAt: element['publishedAt'],
            content: element['content'],
          );
          news.add(articleModel);
      
        }
      });
    }
  }
}
class CategoryNews{
   List<ArticleModel> news = [];
  Future<void> getCategoryNews(String category) async {
    String url =
     'http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=0c334555e9a24ec8a1e40ad1dd30763b';
     

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null || element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            // publishedAt: element['publishedAt'],
            content: element['content'],
          );
          news.add(articleModel);
      
        }
      });
    }
  }
}