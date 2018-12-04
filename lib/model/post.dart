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
