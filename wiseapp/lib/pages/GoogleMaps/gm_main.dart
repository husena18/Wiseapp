import 'package:flutter/material.dart';
import 'package:wiseapp/pages/GoogleMaps/gm1.dart';
import 'package:wiseapp/image_fetch.dart';
import 'dart:ui';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GoogleMaps extends StatefulWidget {
  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  // Define variables to store the selected dropdown values
  String? selectedOption;


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
              child: ImageFetcher(imageUrl: 'instagram_assets/gm4.jpeg'),
            ),
          ),
          // Centered Dialog Box
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.1,
              color: Colors.black,
              // Background color of the dialog box
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButtonWithDropdown(
                    context,
                    AppLocalizations.of(context)!.searchlocation,
                    ['What location should we enter?', '1. Look for famous places like the Eiffel Tower or Statue of Liberty. \n2. Search for popular spots in your city, like parks or restaurants.\n3. Try typing in your home address to see how it works.\n4. Explore streets with the Street View feature.\n5. Switch to Satellite View to see places from above.\n \nBy trying out these things, you will quickly get the hang of how Google Maps works!'],
                    selectedOption,
                    (newValue) {
                      setState(() {
                        selectedOption = newValue;
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
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
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
                  // Implement navigation logic here
                  switch (buttonText) {
                    case 'Search Location':
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GM1Widget()),
                      );
                      break;
                    // Add cases for other buttons if needed
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
                    Icon(Icons.arrow_drop_down),
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
            icon: Icon(Icons.arrow_drop_down,
            color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
