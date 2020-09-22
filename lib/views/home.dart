import 'package:NewsLe/constants.dart';
import 'package:NewsLe/models/aritcle_model.dart';
import 'package:NewsLe/views/blogs_tile.dart';
import 'loading_screen.dart';
import 'package:NewsLe/views/category_new.dart';
import 'package:NewsLe/views/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:NewsLe/models/category_model.dart';
import 'package:NewsLe/helper/data.dart';
import 'package:NewsLe/helper/news.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  bool _loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    setState(() {
      getNews();
    });
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
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
        : Scaffold(
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
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 70,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            imageUrl: categories[index].imageUrl,
                            categoryName: categories[index].categoryName,
                          );
                        },
                      ),
                    ),
                    // Blogs
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
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
