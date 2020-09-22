import 'package:NewsLe/helper/news.dart';
import 'package:NewsLe/models/aritcle_model.dart';
import 'package:NewsLe/views/article_view.dart';
import 'package:NewsLe/views/blogs_tile.dart';
import 'package:flutter/material.dart';
import 'package:NewsLe/views/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Category extends StatefulWidget {
  final String category;
  Category({this.category});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<ArticleModel> articles = List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getCategoryNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  _loading
        ? Center(
            child: Container(
              color: Colors.blue[900],
              child: SpinKitFadingCube(
                duration: Duration(milliseconds: 3000),
                color: Colors.white,
                size: 50,
              ),
            ),
          )
        :Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Text(
                    "News",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    "Le",
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'Montserrat',
                      fontSize: 30,
                    ),
                  )
          ],
        ),
        actions: <Widget>[
          Opacity(opacity: 0),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save))
        ],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        itemCount: articles.length,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return BlogTile(
                            imageUrl: articles[index].urlToImage,
                            title: articles[index].title,
                            description: articles[index].description,
                            url: articles[index].url,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

