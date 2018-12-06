import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'model/userData.dart';

class UserPage extends StatelessWidget {
  UserPage(
    this.user,
  );

  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(tag: "name${user.image}", child: Text(user.name)),
      ),
      body: ListView(
        children: <Widget>[
          Hero(
            tag: "image${user.image}",
                      child: AspectRatio(
              aspectRatio: 1.0,
              child: CachedNetworkImage(
                imageUrl: user.image,
                fit: BoxFit.cover,
                placeholder: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
