import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../model/post.dart';
import '../user.dart';

class PostBlock extends StatefulWidget {
  PostBlock({this.post});

  final Post post;

  @override
  PostBlockState createState() {
    return PostBlockState(post);
  }
}

class PostBlockState extends State<PostBlock> {
  PostBlockState(this.post);

  final Post post;

  void _liked() {
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
          CachedNetworkImage(
            key: ValueKey(post.image),
            imageUrl: post.image,
            placeholder: Center(
              child: CircularProgressIndicator(),
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
                        color: post.liked == true
                            ? Colors.pink[300]
                            : Colors.grey,
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
