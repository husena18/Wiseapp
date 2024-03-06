import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;
  var empty= "https://www.youtube.com/watch?v=9JggrhuUNYY";

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(empty));
    _initializeVideoPlayerFuture = _controller!.initialize().then((_) {
      setState(() {}); // Update the state after initialization completes
    });
    fetchVideoUrl();
  }

  Future<void> fetchVideoUrl() async {
    try {
      var storage = FirebaseStorage.instance;
      var videoRef = storage.ref().child('Adding card details and setting up pin.mp4');
      var url = await videoRef.getDownloadURL();

      setState(() {
        _controller = VideoPlayerController.networkUrl(Uri.parse(url));
        _initializeVideoPlayerFuture = _controller!.initialize();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller!.value.isPlaying) {
              _controller!.pause();
            } else {
              _controller!.play();
            }
          });
        },
        child: Icon(
          _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
