import 'package:flutter/material.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Instagram/Insta_main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
 // Change post6.dart to the next post file if necessary

class Post5IgWidget extends StatelessWidget {
  const Post5IgWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ClipRRect(
                    child: ImageFetcher(
                      imageUrl: 'instagram_assets/WhatsApp_Image_2024-02-28_at_23.15.31_(2).jpeg',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.07, 0.09),
                child: Text(
                  AppLocalizations.of(context)!.postuploaded,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.07, 0.19),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => InstaMain()), 
                    );
                  },
                  child: Text(
                    "Let's explore other functionalities",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
