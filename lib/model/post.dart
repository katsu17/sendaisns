//投稿データを表示するためのモデル
// DateTime というクラスはDartプログラミング言語に最初から存在するクラスで、javascriptでいう Date クラス
// UserData というクラスは我々が作ったクラス。定義はmodelフォルダー内のuserData.dartに書いてある

import 'package:flutter/foundation.dart';

import 'userData.dart';

class Post {
  Post({
    @required this.image,
    @required this.text,
    @required this.postedAt,
    @required this.userData,
  });
  final String image;
  final String text;
  final DateTime postedAt;
  final UserData userData;
}
