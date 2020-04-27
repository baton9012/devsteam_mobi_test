import 'package:devsteammobitest/screens/full_screen_image.dart';
import 'package:devsteammobitest/model/image_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ImageList extends StatefulWidget {
  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  List<ImagesInfo> imagesList = List<ImagesInfo>();
  http.Response response;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    refreshList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
      ),
      body: ListView.builder(
        itemCount: imagesList.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: FlatButton(
              child: Image.network(imagesList[i].smallImageUrl, height: 100, width: 100,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FullScreenImage(imagesList[i].fullImageUrl);
                    },
                  ),
                );
              },
            ),
            title: Row(
              children: <Widget>[
                Text(imagesList[i].firstNameUser, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[900]),),
              ],
            ),
            subtitle: Text(imagesList[i].nameImage),
          );
        },
      ),
    );
  }

  void refreshList() async {
    imagesList = await createListImage(response);
    setState(() {});
  }

  Future<String> getData() async {
    response = await http.get(
        'https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0',
        headers: {'Acceeept': 'application/json'});
    imagesList = await createListImage(response);
  }

  List<ImagesInfo> createListImage(http.Response response) {
    List<ImagesInfo> imageList = List<ImagesInfo>();
    List data = json.decode(response.body);
    for (int i = 0; i < data.length; i++) {
      String username = data[i]["user"]["first_name"];
      String imagename = data[i]["alt_description"];
      String smallImageUrl = data[i]["urls"]["thumb"];
      String fullImageUrl = data[i]["urls"]["full"];
      imageList.add(ImagesInfo(username, imagename, smallImageUrl, fullImageUrl));
    }
    return imageList;
  }
}
