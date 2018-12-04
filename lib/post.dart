import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  @override
  PostPageState createState() {
    return new PostPageState();
  }
}

class PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("投稿")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "投稿内容",
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.image),
                onPressed: () {
                  print("写真ボタンを押した");
                },
              ),
            ],
          ),
          RaisedButton(
            child: Text("投稿"),
            onPressed: () {
              print("投稿ボタンを押した");
            },
          ),
        ],
      ),
    );
  }
}
