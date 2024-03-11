import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:video_player/video_player.dart';
import 'package:wiseapp/pages/Instagram/dm1.dart'; // Assuming Dm1IgWidget is from here

class VideoScreen2 extends StatefulWidget {
  @override
  _VideoScreen2State createState() => _VideoScreen2State();
}

class _VideoScreen2State extends State<VideoScreen2> {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    fetchVideoUrl();
  }

  Future<void> fetchVideoUrl() async {
    try {
      var storage = FirebaseStorage.instance;
      var videoRef = storage.ref().child('dm.mp4');
      var url = await videoRef.getDownloadURL();

      setState(() {
        _controller = VideoPlayerController.network(url);
        _initializeVideoPlayerFuture = _controller!.initialize().then((_) {
          // Start playing the video automatically when it's initialized
          _controller!.play();
        });
      });
    } catch (e) {
      print('Error fetching video URL: $e');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _skipVideo() {
      // Stop the video player
  _controller?.pause();

    // Navigate to the new screen when skip button is pressed
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Dm1IgWidget()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
        actions: [
          TextButton(
            onPressed: _skipVideo,
            child: Text(
              'SKIP',
              style: TextStyle(
                color: Color.fromRGBO(88, 35, 201, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller?.value?.aspectRatio ?? 1.0,
              child: VideoPlayer(_controller!),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
