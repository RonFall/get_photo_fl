import 'package:flutter/material.dart';
import 'package:get_photo_fl/page/photo_list_page.dart';

void main() => runApp(PhotoMain());

class PhotoMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get photo',
      home: PhotoListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


