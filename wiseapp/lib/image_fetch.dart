import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  var empty = "https://img.freepik.com/free-vector/instagram-vector-social-media-icon-7-june-2021-bangkok-thailand_53876-136728.jpg?w=740&t=st=1709804768~exp=1709805368~hmac=3f6ff896dfe249f2ce1392954254d16d8bf00ec843e99719c16fdf0a07876684"; // Default image URL

  @override
  void initState() {
    super.initState();
    fetchImageUrl();
  }

  Future<void> fetchImageUrl() async {
    try {
      var storage = FirebaseStorage.instance;
      var imageRef = storage.ref().child('instagram_assets/instagram.png'); // Replace with your image file name
      var url = await imageRef.getDownloadURL();

      setState(() {
        empty = url;
      });
    } catch (e) {
      print('Error fetching image URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Viewer'),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: empty,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
