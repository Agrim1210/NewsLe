// import 'package:NewsLe/helper/news.dart';
// import 'package:NewsLe/models/aritcle_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';


// class LoadingScreen extends StatefulWidget {
//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }

// class _LoadingScreenState extends State<LoadingScreen> {
//     List<ArticleModel> articles = new List<ArticleModel>();
// bool _loading = true;
// @override
//   void initState() {
//     super.initState();
//     getNews();
//   }
// getNews() async {
//     News newsClass = News();
//     await newsClass.getNews();
//     articles = newsClass.news;
//     setState(() {
//       _loading = false;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[900],
//       body: SpinKitFadingCube(
//         color: Colors.white,
//         size: 100,
//       ),
//     );
//   }
// }