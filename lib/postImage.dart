import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'model/post.dart';

class PostImage extends StatefulWidget {
  PostImage({this.post});
  final Post post;
  @override
  PostImageState createState() {
    return PostImageState(post);
  }
}

class PostImageState extends State<PostImage>
    with SingleTickerProviderStateMixin {
  PostImageState(this.post);
  final Post post;

  Offset scrollStart = Offset(0, 0);
  double verticalScroll = 0.0;
  double verticalScrollEnd = 0.0;
  Offset focalPoint = Offset(0, 0);
  double scale = 1.0;

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    final CurvedAnimation curve =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation = Tween(begin: 1.0, end: 0.0).animate(curve)
      ..addListener(() {
        verticalScroll = animation.value * verticalScrollEnd;
        setState(() {});
      })
      ..addStatusListener((AnimationStatus state) {
        if (state == AnimationStatus.completed) {
          // animationController.reset();
          verticalScrollEnd = 0.0;
        }
      });
    super.initState();
  }

  dispose() {
    animationController.dispose();
    super.dispose();
  }

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
    if (verticalScroll.abs() > 70.0 && scale == 1.0) {
      Navigator.pop(context);
    } else {
      setState(() {
        focalPoint = Offset(0, 0);
        scale = 1.0;
        verticalScrollEnd = verticalScroll;
        // verticalScroll = 0.0;
      });
      animationController.reset();
      animationController.forward();
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
