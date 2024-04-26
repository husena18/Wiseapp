import 'package:flutter/material.dart';
import 'package:wiseapp/pages/Instagram/add_to_story1.dart';
import 'package:wiseapp/pages/Instagram/Add_to_story2.dart';
import 'package:wiseapp/pages/Instagram/add_to_story1.dart';
import 'package:wiseapp/image_fetch.dart';
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the homepage
          },
        ),
      ),
      
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
                    [AppLocalizations.of(context)!.story, AppLocalizations.of(context)!.storyans],
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
                    [AppLocalizations.of(context)!.follow,AppLocalizations.of(context)!.followans],
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
                    [AppLocalizations.of(context)!.dms, AppLocalizations.of(context)!.dmans],
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
                    [AppLocalizations.of(context)!.posts, AppLocalizations.of(context)!.postans],
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
                    [AppLocalizations.of(context)!.reelss, AppLocalizations.of(context)!.reelsans],
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
                    case 'તમારા વાર્તા માટે 24 કલાક ઉમેરો':
                    case 'अपनी कहानी में 24 घंटे के लिए जोड़ें':

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Addtostory1IgWidget()),
                      );
                      break;
                    case 'Search and follow your friends':
                    case 'તમારા મિત્રો શોધો અને અનુસરો':
                    case 'अपने दोस्तों को खोजें और फॉलो करें':
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VideoScreen2()),
                      );
                      break;
                    case 'Text your friends (DM)':
                    case 'તમારા મિત્રોને ટેક્સ્ટ કરો (DM)':
                    case 'अपने दोस्तों को टेक्स्ट करें (DM)':
                  
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VideoScreen2()),
                      );
                      break;
                    case 'Post for everyone to see':
                    case 'બધાને જોવા માટે પોસ્ટ કરો':
                    case 'सभी को दिखाने के लिए पोस्ट करें':
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Post1IgWidget()),
                      );
                      break;
                    case 'Scroll through reels for fun videos':
                    case 'મજા માટે રીલ્સ સ્ક્રોલ કરો':
                    case 'मजेदार वीडियो के लिए रील्स स्क्रॉल करें':
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