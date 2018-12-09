// 新しい投稿をすることができる画面

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class ProfileEditPage extends StatefulWidget {
  @override
  ProfileEditPageState createState() {
    return ProfileEditPageState();
  }
}

class ProfileEditPageState extends State<ProfileEditPage> {
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
      appBar: AppBar(title: Text("プロフィール編集")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8.0),
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "名前",
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.image),
                onPressed: getImage,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
              ),
            ],
          ),
          _image == null ? Container() : Image.file(_image),
          Container(
            padding: EdgeInsets.all(8.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.orange,
                child: Text(
                  "編集する",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  print("編集するボタンを押した");
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
