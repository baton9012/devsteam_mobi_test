import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {

  String _fullImageUrl;

  FullScreenImage(this._fullImageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Image.network(_fullImageUrl),),);
  }
}