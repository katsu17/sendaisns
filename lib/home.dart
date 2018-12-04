import 'package:flutter/material.dart';

import 'post.dart';
import 'model/post.dart';
import 'model/userData.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> _posts = [];

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

  // {
  //   "user": {
  //     "name": "鈴木光",
  //     "image":
  //         "https://images.performgroup.com/di/library/GOAL/10/dc/2017-08-31-beauty-main_xos0ywk31hxe1roo4yjttema0.jpg?t=916685574&quality=90&w=1280"
  //   },
  //   "image":
  //       "https://tblg.k-img.com/restaurant/images/Rvw/50600/50600742.jpg",
  //   "text": "阿部の笹かまの工場見学楽しかった！",
  //   "posted_at": DateTime(2018, 12, 2),
  // },
  // {
  //   "user": {
  //     "name": "Sayaka",
  //     "image":
  //         "http://www.bijogoyomi.com/news/wp-content/uploads/2015/03/img21.jpg"
  //   },
  //   "image": "https://www.dokka.jp/uimg/site3518-00.jpg",
  //   "text": "青葉城跡からの夜景はいつきても本当に綺麗",
  //   "posted_at": DateTime(2018, 12, 1),
  // },
  // {
  //   "user": {
  //     "name": "Yumi",
  //     "image":
  //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQzVytxSQxlQtWISWuQHWy-WIJsW3064Ipo9U5YHv9sI5Bssb0kA"
  //   },
  //   "image":
  //       "http://www.hokke.co.jp/wp/wp-content/uploads/2016/12/15203375_991274524350153_6547536103821712975_n.jpg",
  //   "text": "今年の光のページェントは例年よりも始まるのが遅くて残念＞＜早く始まらないかな〜",
  //   "posted_at": DateTime(2018, 11, 28),
  // },

  Widget _postBlock(Post post) {
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
                ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.network(
                      post.userData.image,
                      fit: BoxFit.cover,
                      height: 50.0,
                      width: 50.0,
                    )),
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
          Image.network(
            post.image,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("仙台SNS"),
      ),
      body: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            return _postBlock(_posts[index]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostPage()),
          );
        },
        tooltip: '投稿',
        child: Icon(Icons.edit),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.network(
                          "https://i.ytimg.com/vi/hYvkSHYh_WQ/hqdefault.jpg",
                          fit: BoxFit.cover,
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                      Container(
                        width: 4.0,
                      ),
                      Text('Sophie'),
                    ],
                  ),
                  Container(
                    height: 8.0,
                  ),
                  Text("189投稿"),
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
              title: Text(
                "プロフィール",
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "設定",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
