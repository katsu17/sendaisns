import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io';

import 'model/post.dart';

class PostImage extends StatefulWidget {
  PostImage({this.post});
  final Post post;
  @override
  PostImageState createState() {
    return PostImageState(post);
  }
}

class PostImageState extends State<PostImage> {
  PostImageState(this.post);
  final Post post;

  Offset scrollStart;
  Offset scrollDifference;

  void _dragStart(DragStartDetails dragStartDetail) {
    setState(() {
          scrollStart = dragStartDetail.globalPosition;
        });
  }

  void _dragUpdate(DragUpdateDetails dragUpdateDetail) {

  }

  void _dragEnd(DragEndDetails dragEndDetail) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Hero(
            tag: "postImage${post.image}",
            child: GestureDetector(
              onVerticalDragStart: _dragStart,
              onVerticalDragUpdate: _dragUpdate,
              onVerticalDragEnd: _dragEnd,
                          child: CachedNetworkImage(
                imageUrl: post.image,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
