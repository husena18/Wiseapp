import 'package:flutter/material.dart';
import 'package:wiseapp/pages/Instagram/add_to_story1.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Instagram/dm1.dart'; 
import 'dart:ui';
import 'package:wiseapp/pages/Instagram/follow1.dart';
import 'package:wiseapp/pages/Instagram/follow2.dart';// Import the file where ImageFetcher is defined

class InstaMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image using ImageFetcher
          Positioned.fill(
            child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: ImageFetcher(imageUrl: 'instagram_assets/WhatsApp_Image_2024-02-28_at_23.28.03.jpeg'),
          ),
           ), // Centered Dialog Box
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95, // Adjust the width as needed
              height: MediaQuery.of(context).size.height * 0.4, // Adjust the height as needed
              color: Colors.black,
               // Background color of the dialog box
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push( // Navigate to add_to_story.dart when button is pressed
                        context,
                        MaterialPageRoute(builder: (context) => Addtostory1IgWidget()),
                      );
                    },
                    child: Text('Add to your story for 24 hrs'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push( // Navigate to add_to_story.dart when button is pressed
                        context,
                        MaterialPageRoute(builder: (context) => Follow1IgWidget(),
                      ));
                      // Handle button press
                    },
                    child: Text('Search and follow your friends'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push( // Navigate to add_to_story.dart when button is pressed
                        context,
                        MaterialPageRoute(builder: (context) => Dm1IgWidget(),
                      ));
                      // Handle button press
                    },
                    child: Text('Text your friends (DM)'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                       Navigator.push( // Navigate to add_to_story.dart when button is pressed
                        context,
                        MaterialPageRoute(builder: (context) => Follow1IgWidget()),
                      );
                      // Handle button press
                    },
                    child: Text('Post for everyone to see'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    child: Text('Scroll through reels for fun videos'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
