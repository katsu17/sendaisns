//コメント用のモデル。

import 'package:flutter/foundation.dart';

import 'userData.dart';

class Comment {
  Comment({
    @required this.text,
    @required this.createdAt,
    @required this.commentarData,
  });

  final String text; 
  final String createdAt;
  final UserData commentarData;
}
