// insta_main.dart
import 'package:flutter/material.dart';
import 'package:wiseapp/pages/Instagram/add_to_story1.dart';

class InstaMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/Instagram.jpg', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          // Centered Dialog Box
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8, // Adjust the width as needed
              height: MediaQuery.of(context).size.height * 0.4, // Adjust the height as needed
              color: Colors.white, // Background color of the dialog box
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
                      // Handle button press
                    },
                    child: Text('Search and follow your friends'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    child: Text('Text your friends (DM)'),
                  ),
                  ElevatedButton(
                    onPressed: () {
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
