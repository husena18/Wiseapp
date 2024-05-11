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
                imageUrl: 'Pinterest/HOMEPAGE_D.jpeg',
              ),
            ),
          ),
          // Centered Dialog Box
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.3,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButtonWithDropdown(
                    context,
                    AppLocalizations.of(context)!.signin,
                    [AppLocalizations.of(context)!.signq, AppLocalizations.of(context)!.signa],
                    selectedOption1,
                    (newValue) {
                      setState(() {
                        selectedOption1 = newValue;
                      });
                    },
                  ),
                  buildButtonWithDropdown(
                    context,
                    AppLocalizations.of(context)!.login,
                    [AppLocalizations.of(context)!.loginq,AppLocalizations.of(context)!.logina],
                    selectedOption2,
                    (newValue) {
                      setState(() {
                        selectedOption2 = newValue;
                      });
                    },
                  ),
                  buildButtonWithDropdown(
                    context,
                    AppLocalizations.of(context)!.follow,
                    [AppLocalizations.of(context)!.followq, AppLocalizations.of(context)!.followa],
                    selectedOption3,
                    (newValue) {
                      setState(() {
                        selectedOption3 = newValue;
                      });
                    },
                  ),
                  buildButtonWithDropdown(
                    context,
                    AppLocalizations.of(context)!.share,
                    [AppLocalizations.of(context)!.shareq, AppLocalizations.of(context)!.sharea],
                    selectedOption4,
                    (newValue) {
                      setState(() {
                        selectedOption4 = newValue;
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

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signin1Widget()),
                      );
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => log1Widget()),
                      );
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => follow1Widget()),
                      );
                     
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => share1Widget()),
                      );
                    
                  }
                ,
                
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
          // Dropdown arrow
      
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
