import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:video_player/video_player.dart';
import 'package:wiseapp/pages/Instagram/dm1.dart';
import 'package:wiseapp/pages/Whatsapp/call1.dart';
import 'package:wiseapp/pages/Whatsapp/message1.dart';
import 'package:wiseapp/pages/Whatsapp/updates1.dart'; // Assuming Dm1IgWidget is from here

class VideoScreen3w3 extends StatefulWidget {
  @override
  VideoScreen3State createState() => VideoScreen3State();
}

class VideoScreen3State extends State<VideoScreen3w3> {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;
  bool isVideoPlaying = true;

  @override
  void initState() {
    super.initState();
    fetchVideoUrl();
  }

  Future<void> fetchVideoUrl() async {
    try {
      var storage = FirebaseStorage.instance;
      var videoRef = storage.ref().child('Writing a Status.mp4');
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
      MaterialPageRoute(builder: (context) => Updates1Widget()),
    );
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller!.value.isPlaying) {
        _controller!.pause();
        isVideoPlaying = false;
      } else {
        _controller!.play();
        isVideoPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 9 / 18.5; // Aspect ratio for Google Pixel 3a XL

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
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: aspectRatio,
                    child: VideoPlayer(_controller!),
                  ),
                  IconButton(
                    icon: Icon(
                      isVideoPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                    onPressed: _togglePlayPause,
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}