import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';


class ImageFetcher extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  const ImageFetcher({
<<<<<<< Updated upstream
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
=======
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.fill,
    Key? key,
>>>>>>> Stashed changes
  }) : super(key: key);

  Future<String?> fetchImageUrl() async {
    try {
      var storage = FirebaseStorage.instance;
      var imageRef = storage.ref().child(imageUrl);
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
<<<<<<< Updated upstream
          return Image.network(
            snapshot.data!,
=======
          return Image(
            image: CachedNetworkImageProvider(snapshot.data!),
>>>>>>> Stashed changes
            width: width,
            height: height,
            fit: fit,
          );
        }
      },
    );
  }
}
