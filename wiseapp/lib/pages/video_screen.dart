import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:video_player/video_player.dart';
import 'package:wiseapp/pages/Instagram/add_to_story1.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  final String _videoUrl = "https://www.youtube.com/watch?v=9JggrhuUNYY";

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(_videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {
        // Start playing the video automatically when it's initialized
        _controller.play();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _skipVideo() {
    // Navigate to the new screen when skip button is pressed
    // Call the function that navigates to the new screen here
    // For example:
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Addtostory1IgWidget()),
    );
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
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _skipVideo,
        child: Text('Skip'),
      ),
    );
  }
}

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Screen'),
      ),
      body: Center(
        child: Text('This is the new screen'),
      ),
    );
  }
}
