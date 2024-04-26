import 'package:flutter/material.dart';
import 'package:wiseapp/pages/IRCTC/irctc1.dart';
import 'package:wiseapp/image_fetch.dart';
import 'dart:ui';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IRCTC extends StatefulWidget {
  @override
  _IRCTCState createState() => _IRCTCState();
}

class _IRCTCState extends State<IRCTC> {
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
              child: ImageFetcher(imageUrl: 'IRCTC/IMG_4873.PNG'),
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
                    [AppLocalizations.of(context)!.whatlocation, AppLocalizations.of(context)!.locans],
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
                  
                      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IRCTC1Widget()),
    );
                    // Add cases for other buttons if needed
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
            icon: Icon(Icons.arrow_drop_down,
            color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
