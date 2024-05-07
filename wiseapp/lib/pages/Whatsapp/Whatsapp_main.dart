import 'package:flutter/material.dart';
import 'package:wiseapp/pages/Whatsapp/linkd1.dart';
import 'package:wiseapp/pages/Whatsapp/call1.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Whatsapp/message1.dart';
import 'dart:ui';
import 'package:wiseapp/pages/Whatsapp/updates1.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Whatsapp extends StatefulWidget {
  @override
  _WhatsappState createState() => _WhatsappState();
}

class _WhatsappState extends State<Whatsapp> {
  // Define variables to store the selected dropdown values
  String? selectedOption1;
  String? selectedOption2;
  String? selectedOption3;

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
                imageUrl: 'whatsapp/call3.jpg',
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
                    AppLocalizations.of(context)!.status,
                    [AppLocalizations.of(context)!.statusq, AppLocalizations.of(context)!.statusa],
                    selectedOption1,
                    (newValue) {
                      setState(() {
                        selectedOption1 = newValue;
                      });
                    },
                  ),
                
                  buildButtonWithDropdown(
                    context,
                    AppLocalizations.of(context)!.call,
                    [AppLocalizations.of(context)!.callq, AppLocalizations.of(context)!.calla],
                    selectedOption2,
                    (newValue) {
                      setState(() {
                        selectedOption2 = newValue;
                      });
                    },
                  ),
                  buildButtonWithDropdown(
                    context,
                    AppLocalizations.of(context)!.picsend,
                    [AppLocalizations.of(context)!.picq, AppLocalizations.of(context)!.pica],
                    selectedOption3,
                    (newValue) {
                      setState(() {
                        selectedOption3 = newValue;
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
                  

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Updates1Widget()),
                      );
                    
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Call1Widget()),
                      );
                     
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Message1Widget()),
                      );
                      

                  
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
