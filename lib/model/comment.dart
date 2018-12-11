//コメント用のモデル。

import 'package:flutter/foundation.dart';

import 'userData.dart';

class comment {
  comment({
    @required this.text,
    @required this.createdAt,
    this.commentarData,
  });

  final String text; 
  final String createdAt;
  final UserData commentarData;
}
