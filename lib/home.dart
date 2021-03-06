//投稿一覧がみれるメイン画面

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'dart:async';

import 'post.dart';
import 'profileedit.dart';
import 'user.dart';
import 'welcome.dart';
import 'model/post.dart';
import 'model/userData.dart';
import 'helper/postBlock.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> _posts = [];
  List<PostBlock> _postBlocks = [];
  UserData myProfile = UserData(
    name: "Sophie",
    image: "https://i.ytimg.com/vi/hYvkSHYh_WQ/hqdefault.jpg",
    postedNumber: 189,
  );

  @override
  void initState() {
    _posts = [
      Post(
        image:
            "https://tblg.k-img.com/restaurant/images/Rvw/50600/50600742.jpg",
        text: "阿部の笹かまの工場見学楽しかった！",
        postedAt: DateTime(2018, 12, 2),
        userData: UserData(
          name: "光",
          image:
              "https://images.performgroup.com/di/library/GOAL/10/dc/2017-08-31-beauty-main_xos0ywk31hxe1roo4yjttema0.jpg?t=916685574&quality=90&w=1280",
        ),
      ),
      Post(
        image: "https://www.dokka.jp/uimg/site3518-00.jpg",
        text: "青葉城跡からの夜景はいつきても本当に綺麗",
        postedAt: DateTime(2018, 12, 1),
        userData: UserData(
          name: "Sayaka",
          image:
              "http://www.bijogoyomi.com/news/wp-content/uploads/2015/03/img21.jpg",
        ),
      ),
      Post(
        image:
            "http://www.hokke.co.jp/wp/wp-content/uploads/2016/12/15203375_991274524350153_6547536103821712975_n.jpg",
        text: "今年の光のページェントは例年よりも始まるのが遅くて残念＞＜早く始まらないかな〜",
        postedAt: DateTime(2018, 11, 30),
        userData: UserData(
          name: "Yumi",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQzVytxSQxlQtWISWuQHWy-WIJsW3064Ipo9U5YHv9sI5Bssb0kA",
        ),
      ),
    ];
    super.initState();
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 1));
    final UserData user = UserData(
        name: "maru",
        image:
            "https://www.sankei.com/images/news/181119/spo1811190018-p1.jpg");
    final post = Post(
      userData: user,
      image: "https://i.ytimg.com/vi/zoVJbv5Zm7M/maxresdefault.jpg",
      text: "楽天みたいな弱小球団に誰が行くかボケ",
      postedAt: DateTime(2018, 12, 6),
    );
    _posts.insert(0, post);
    setState(() {});
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar(context),
      body: body(),
      floatingActionButton: fab(context),
      drawer: drawer(context),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text("仙台SNS"),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "Welcome",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WelcomePage(),
              ),
            );
          },
        ),
      ],
    );
  }

  RefreshIndicator body() {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Demo'),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(List.generate(_posts.length + 1, (index) {
                if (index == _posts.length)
                  return Container(
                    height: 80.0,
                  );
                return PostBlock(
                    key: ObjectKey(_posts[index]), post: _posts[index]);
            })),
          ),
        ],
      ),
    );
  }

  FloatingActionButton fab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostPage(),
          ),
        );
      },
      tooltip: '投稿',
      child: Icon(Icons.edit),
    );
  }

  Drawer drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(35.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserPage(myProfile),
                        ),
                      );
                    },
                    child: CachedNetworkImage(
                      imageUrl: myProfile.image,
                      placeholder: Container(
                        width: 70.0,
                        height: 70.0,
                        child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                      fit: BoxFit.cover,
                      width: 70.0,
                      height: 70.0,
                    ),
                  ),
                ),
                Container(
                  height: 8.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserPage(myProfile),
                      ),
                    );
                  },
                  child: Text(
                    myProfile.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Container(
                  height: 8.0,
                ),
                Text(
                  "${myProfile.postedNumber}投稿",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
            ),
            title: Text("プロフィール",
                style: TextStyle(
                  color: Colors.grey,
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileEditPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              "設定",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            onTap: () {
              print("tap");
            },
          ),
        ],
      ),
    );
  }
}
