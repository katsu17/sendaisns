import 'package:flutter/material.dart';

import 'post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '仙台SNS',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.cyan,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          body1: TextStyle(
            fontSize: 15.0,
          ),
          button: TextStyle(
            color: Colors.white,
          ),
        ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map> _posts = [
    {
      "user": {
        "name": "鈴木光",
        "image":
            "https://images.performgroup.com/di/library/GOAL/10/dc/2017-08-31-beauty-main_xos0ywk31hxe1roo4yjttema0.jpg?t=916685574&quality=90&w=1280"
      },
      "image":
          "https://tblg.k-img.com/restaurant/images/Rvw/50600/50600742.jpg",
      "text": "阿部の笹かまの工場見学楽しかった！"
    },
    {
      "user": {
        "name": "Sayaka",
        "image":
            "http://www.bijogoyomi.com/news/wp-content/uploads/2015/03/img21.jpg"
      },
      "image": "https://www.dokka.jp/uimg/site3518-00.jpg",
      "text": "青葉城跡からの夜景はいつきても本当に綺麗"
    },
  ];

  Widget _postBlock(Map post) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.network(
                      post["user"]["image"],
                      fit: BoxFit.cover,
                      height: 50.0,
                      width: 50.0,
                    )),
                Container(
                  width: 8.0,
                ),
                Text(
                  post["user"]["name"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 4.0,
            ),
            child: Text(
              post["text"],
              style: Theme.of(context).textTheme.body1,
            ),
          ),
          Image.network(
            post["image"],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("仙台SNS"),
      ),
      body: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            return _postBlock(_posts[index]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostPage()),
          );
        },
        tooltip: '投稿',
        child: Icon(Icons.edit),
      ),
    );
  }
}
