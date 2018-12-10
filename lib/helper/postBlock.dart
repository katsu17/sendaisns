import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'dart:async';
import 'dart:math' as math;

import '../model/post.dart';
import '../user.dart';

// class LikeCurve extends Curve {
//   final double pi = 3.141592653;
//   final double overFactor = 1.2;
//   final double threshold = 0.5;
//   @override
//   double transform(double t) {
//     if(t < threshold) return math.sin(t / threshold * pi * 0.5) * overFactor;
//     if(t < (1 - (1 - threshold) / 2)) return overFactor - math.cos((t - threshold) * pi) * (overFactor -1) / 2 + (overFactor - 1) / 2;
//     return  overFactor - (overFactor - 1) / 2 - math.sin((t - (1 - (1 - threshold) / 2)) * pi * 5) * (overFactor - 1) / 2;
//   }
// }

class PostBlock extends StatefulWidget {
  PostBlock({this.post});

  final Post post;

  @override
  PostBlockState createState() {
    return PostBlockState(post);
  }
}

class PostBlockState extends State<PostBlock>
    with SingleTickerProviderStateMixin {
  PostBlockState(this.post);

  final Post post;

  double _postLikedIconSize = 0.0;

  AnimationController controller;
  Animation<double> animation;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.easeOut);
    animation = Tween(begin: 0.0, end: 80.0).animate(curve)
      ..addListener(() {
        if (animation.value >= 0.0) _postLikedIconSize = animation.value;
        setState(() {});
      })
      ..addStatusListener((AnimationStatus state) {
        if (state == AnimationStatus.completed) {
          Timer(Duration(milliseconds: 900), () {
            _postLikedIconSize = 0.0;
            setState(() {});
            controller.reverse();
          });
        }
      });
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

  void _liked() {
    if (post.liked != true) controller.forward();
    post.pressedLike();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserPage(post.userData),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Hero(
                        tag: "image${post.userData.image}",
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: CachedNetworkImage(
                            key: ValueKey(post.userData.image),
                            imageUrl: post.userData.image,
                            fit: BoxFit.cover,
                            width: 50.0,
                            height: 50.0,
                            placeholder: Container(
                              height: 50.0,
                              width: 50.0,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 8.0,
                      ),
                      Text(
                        post.userData.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Text(
                  "${post.postedAt.year}/${post.postedAt.month}/${post.postedAt.day}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
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
              post.text,
              style: Theme.of(context).textTheme.body1,
            ),
          ),
          InkWell(
            onDoubleTap: _liked,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.black,
                    ),
                    body: Container(
                        color: Colors.black,
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
            },
            child: Stack(
              children: <Widget>[
                Hero(
                  tag: "postImage${post.image}",
                  child: CachedNetworkImage(
                    key: ValueKey(post.image),
                    imageUrl: post.image,
                    placeholder: Container(
                      height: MediaQuery.of(context).size.width * 9 / 16,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  bottom: 0.0,
                  left: 0.0,
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white54,
                      size: _postLikedIconSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                onTap: _liked,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        post.liked == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            post.liked == true ? Colors.pink[300] : Colors.grey,
                      ),
                      Container(
                        width: 4.0,
                      ),
                      Text(
                        post.likeCount == null
                            ? "0"
                            : post.likeCount.toString(),
                        style: TextStyle(
                          fontSize: 18.0,
                          color: post.liked == true
                              ? Colors.pink[300]
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
