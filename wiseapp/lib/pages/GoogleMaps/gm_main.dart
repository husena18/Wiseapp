import 'package:flutter/material.dart';
import 'package:wiseapp/pages/GoogleMaps/gm1.dart';
import 'package:wiseapp/image_fetch.dart';
import 'dart:ui';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class GoogleMaps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image using ImageFetcher
          Positioned.fill(
            child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: ImageFetcher(imageUrl: 'instagram_assets/gm4.jpeg'),
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
                      Navigator.push( 
                        context,
                        MaterialPageRoute(builder: (context) => GM1Widget()),
                      );
                    },
                    child: Text(AppLocalizations.of(context)!.searchlocation),
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
                