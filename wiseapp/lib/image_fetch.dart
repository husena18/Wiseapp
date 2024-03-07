import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageFetcher extends StatelessWidget {
  final String imageUrl;

  const ImageFetcher({Key? key, required this.imageUrl}) : super(key: key);

  Future<String?> fetchImageUrl() async {
    try {
      var storage = FirebaseStorage.instance;
      var imageRef = storage.ref().child(imageUrl); // Use the imageUrl directly
      return await imageRef.getDownloadURL();
    } catch (e) {
      print('Error fetching image URL: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: fetchImageUrl(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return Center(child: Text('Failed to load image'));
        } else {
          return Image.network(snapshot.data!);
        }
      },
    );
  }
}
