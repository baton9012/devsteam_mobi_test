import 'package:flutter/material.dart';

import 'screens/image_list.dart';

void main() => runApp(ImageView());

class ImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ImageView',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: ImageList(),
    );
  }
}
