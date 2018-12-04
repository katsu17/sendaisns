import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '仙台SNS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
    }
  ];

  Widget _postBlock(Map post) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Image.network(post["user"]["image"], fit: BoxFit.cover,height: 50.0, width: 50.0,),
              Container(width: 8.0,),
            Text(post["user"]["name"]),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,),
          child: Text(post["text"]),
        ),
        Image.network(post["image"]),
      ],
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
          print("投稿ボタンを押しました");
        },
        tooltip: '投稿',
        child: Icon(Icons.edit),
      ),
    );
  }
}
