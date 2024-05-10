import 'package:flutter/material.dart';
import 'package:wiseapp/pages/Pinterest/follow1.dart';
import 'package:wiseapp/pages/Pinterest/log1.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Pinterest/share1.dart';
import 'dart:ui';
import 'package:wiseapp/pages/Pinterest/signin1.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wiseapp/pages/video_screen.dart';
import 'package:wiseapp/pages/video_screen2.dart';


class Pinterest extends StatefulWidget {
  @override
  _PinterestState createState() => _PinterestState();
}

class _PinterestState extends State<Pinterest> {
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
                imageUrl: 'Pinterest/login:signup_DM.jpeg.jpeg',
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
                    case 'Sign In to Pinterest':
                    case 'તમારા વાર્તા માટે 24 કલાક ઉમેરો':
                    case 'अपनी कहानी में 24 घंटे के लिए जोड़ें':

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signin1Widget()),
                      );
                      break;
                    case 'Log In to Pinterest':
                    case 'તમારા મિત્રો શોધો અને અનુસરો':
                    case 'अपने दोस्तों को खोजें और फॉलो करें':
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => log1Widget()),
                      );
                      break;
                    case 'Search and Follow People':
                    case 'તમારા મિત્રોને ટેક્સ્ટ કરો (DM)':
                    case 'अपने दोस्तों को टेक्स्ट करें (DM)':
                  
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => follow1Widget()),
                      );
                      break;
                    case 'Share Pins with Friends':
                    case 'બધાને જોવા માટે પોસ્ટ કરો':
                    case 'सभी को दिखाने के लिए पोस्ट करें':
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => share1Widget()),
                      );
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
