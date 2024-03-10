import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wiseapp/pages/Instagram/add_to_story2.dart';

class Addtostory1IgWidget extends StatefulWidget {
  const Addtostory1IgWidget({Key? key}) : super(key: key);

  @override
  State<Addtostory1IgWidget> createState() => _Addtostory1IgWidgetState();
}

class _Addtostory1IgWidgetState extends State<Addtostory1IgWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ClipRRect(
                  child: ImageFetcher(
                    imageUrl: 'instagram_assets/WhatsApp_Image_2024-02-28_at_23.25.40_(1).jpeg',
                  ),
                ),
              ),
            ),
            GestureDetector( // Wrap Lottie.asset with GestureDetector
              onTap: () {
                Navigator.push( // Navigate to another page when animation is clicked
                  context,
                  MaterialPageRoute(builder: (context) => Addtostory2IgWidget()), // Replace DestinationPage with your destination page
                );
              },
              child: Opacity(
                opacity: 0.8,
                child: Align(
                  alignment: AlignmentDirectional(0.3, 0.43),
                  child: Lottie.asset(
                    'animations/cursor.json',
                    width: 250,
                    height: 220,
                    reverse: true,
                    repeat: true,
                    fit: BoxFit.fitWidth,
                    animate: true,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.01, -0.79),
              child: InkWell(
                onTap: () async {
                  // Handle onTap
                },
                child: Text(
                  AppLocalizations.of(context)!.fromgallery,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}