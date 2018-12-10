//ユーザーデータ用のモデル。
// 12月6日時点でユーザー名とプロフィール画像のURLしかないけれど、今後様々なデータが
// 追加されていくことが予想されるので（自己紹介など）、複数人でプロジェクトをするときは
// このようにモデルとして定義しておいてどのデータの名前がなんだったかわからなくならないように整理しておくべし。

import 'package:flutter/foundation.dart';

class UserData {
  UserData({
    @required this.name,
    @required this.image,
    this.postedNumber,
  });
  final String name;
  final String image;
  final int postedNumber;
}
