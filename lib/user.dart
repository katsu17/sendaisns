import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'model/userData.dart';

class UserPage extends StatefulWidget {
  UserPage(
    this.user,
  );

  final UserData user;

  @override
  UserPageState createState() {
    return UserPageState(user);
  }
}

class UserPageState extends State<UserPage> {
  UserPageState(this.user);

  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.0,
                      child: CachedNetworkImage(
              imageUrl: user.image,
              fit: BoxFit.cover,
              placeholder: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
