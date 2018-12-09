// 新しい投稿をすることができる画面

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class PostPage extends StatefulWidget {
  @override
  PostPageState createState() {
    return PostPageState();
  }
}

class PostPageState extends State<PostPage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

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
                onPressed: getImage,
              ),
            ],
          ),
          _image == null ? Container() : Image.file(_image),
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
