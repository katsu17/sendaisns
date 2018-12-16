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

  Offset scrollStart = Offset(0, 0);
  double verticalScroll = 0.0;
  Offset focalPoint = Offset(0, 0);
  double scale = 1.0;

  void _scaleStart(ScaleStartDetails scaleStartDetail) {
    focalPoint = scaleStartDetail.focalPoint;
    scrollStart = focalPoint;
  }

  void _scaleUpdate(ScaleUpdateDetails scaleUpdateDetail) {
    setState(() {
      focalPoint = scaleUpdateDetail.focalPoint;
      scale = scaleUpdateDetail.scale;
      verticalScroll = scaleUpdateDetail.focalPoint.dy - scrollStart.dy;
    });
  }

  void _scaleEnd(ScaleEndDetails scaleEndDetail) {
    if (verticalScroll.abs() > 50.0 && scale == 1.0) {
      Navigator.pop(context);
    } else {
      setState(() {
        focalPoint = Offset(0, 0);
        scale = 1.0;
        verticalScroll = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        onScaleStart: _scaleStart,
        onScaleUpdate: _scaleUpdate,
        onScaleEnd: _scaleEnd,
        child: Container(
          color: Colors.black,
          child: Transform(
            origin: focalPoint,
            // origin: Offset(0.0, 200.0),
            transform: Matrix4.translationValues(0.0, verticalScroll, 0.0)
                .scaled(scale, scale),
            child: Center(
              child: Hero(
                tag: "postImage${post.image}",
                child: CachedNetworkImage(
                  imageUrl: post.image,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
