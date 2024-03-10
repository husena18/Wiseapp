import 'package:flutter/material.dart';
import 'package:wiseapp/pages/Instagram/add_to_story1.dart';
import 'package:wiseapp/pages/Instagram/Add_to_story2.dart';
import 'package:wiseapp/pages/Instagram/add_to_story1.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Instagram/add_to_story2.dart';
import 'package:wiseapp/pages/Instagram/dm1.dart';
import 'dart:ui';
import 'package:wiseapp/pages/Instagram/follow1.dart';
import 'package:wiseapp/pages/Instagram/post1.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wiseapp/pages/video_screen.dart';
import 'package:wiseapp/pages/video_screen2.dart';

class InstaMain extends StatefulWidget {
  @override
  _InstaMainState createState() => _InstaMainState();
}

class _InstaMainState extends State<InstaMain> {
  // Define variables to store the selected dropdown values
  String? selectedOption1;
  String? selectedOption2;
  String? selectedOption3;
  String? selectedOption4;
  String? selectedOption5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image using ImageFetcher
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: ImageFetcher(
                imageUrl: 'instagram_assets/WhatsApp_Image_2024-02-28_at_23.28.03.jpeg',
              ),
            ),
          ),
          // Centered Dialog Box
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.4,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButtonWithDropdown(
                    context,
                    AppLocalizations.of(context)!.storyadd,
                    ['What is an instagram story?', 'Instagram Stories are like temporary slideshows of photos and videos that you can share with your followers. They disappear after 24 hours, and you can add fun stuff like stickers and drawings to make them more interesting. Its a way to share moments from your day in a casual and temporary way.'],
                    selectedOption1,
                    (newValue) {
                      setState(() {
                        selectedOption1 = newValue;
                      });
                    },
                  ),
                  buildButtonWithDropdown(
                    context,
                    AppLocalizations.of(context)!.searchfollow,
                    ['Why should we follow someone?', ' the "follow" feature on Instagram allows you to stay connected with other users by subscribing to their updates. When you follow someone, their posts and stories will appear in your feed, making it easy to see what they are sharing.'],
                    selectedOption2,
                    (newValue) {
                      setState(() {
                        selectedOption2 = newValue;
                      });
                    },
                  ),
                  buildButtonWithDropdown(
                    context,
                    AppLocalizations.of(context)!.dm,
                    ['What is DM(Direct Message)?', 'Direct Message (DM) is a messaging function in Instagram that allows you to send private messages to a specific user or a group of users. You can send text, photos, videos, and links in a DM.'],
                    selectedOption3,
                    (newValue) {
                      setState(() {
                        selectedOption3 = newValue;
                      });
                    },
                  ),
                  buildButtonWithDropdown(
                    context,
                    AppLocalizations.of(context)!.post,
                    ['What is a post?', 'A post is a photo or video that you share on Instagram. You can share it with your followers, or with a specific group of people using the "Close Friends" feature. You can also add a caption, location, and hashtags to your post.'],
                    selectedOption4,
                    (newValue) {
                      setState(() {
                        selectedOption4 = newValue;
                      });
                    },
                  ),
                  buildButtonWithDropdown(
                    context,
                    AppLocalizations.of(context)!.reels,
                    ['What is meant by reels?', 'Reels is a feature on Instagram that allows you to create and share short videos with music, text, and other creative effects. You can share reels with your followers, or on the Explore page, where anyone on Instagram can discover them.'],
                    selectedOption5,
                    (newValue) {
                      setState(() {
                        selectedOption5 = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtonWithDropdown(BuildContext context, String buttonText, List<String> dropdownItems, String? selectedValue, Function(String?) onChanged) {
    return Card(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Button with dropdown
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                  switch (buttonText) {
                    case 'Add to your story for 24 hrs':
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VideoScreen()),
                      );
                      break;
                    case 'Search and follow your friends':
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VideoScreen2()),
                      );
                      break;
                    case 'Text your friends (DM)':
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VideoScreen2()),
                      );
                      break;
                    case 'Post for everyone to see':
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Post1IgWidget()),
                      );
                      break;
                    case 'Scroll through reels for fun videos':
                      // Handle Reels button press
                      break;
                  }
                },
                child: Row(
                  children: [
                    Text(
                      buttonText,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Dropdown menu
          IconButton(
            onPressed: () {
              // Handle dropdown arrow click to show/hide dropdown menu
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView(
                      children: dropdownItems.map((item) {
                        return ListTile(
                          title: Text(
                            item,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {
                            onChanged(item);
                            Navigator.pop(context);
                          },
                        );
                      }).toList(),
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.arrow_drop_down, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
