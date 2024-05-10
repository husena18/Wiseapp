import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Zomato/zomato_main.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Zomato5Widget extends StatefulWidget {
  const Zomato5Widget({Key? key}) : super(key: key);

  @override
  State<Zomato5Widget> createState() => _Zomato5WidgetState();
}

class _Zomato5WidgetState extends State<Zomato5Widget> {
  late FlutterTts flutterTts;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    addVoiceCommand(); // Call the method to speak the welcome text
  }

  Future<void> addVoiceCommand() async {
    await flutterTts.setLanguage('en');
    await flutterTts.setLanguage('hi');
    await flutterTts.setLanguage('gu');
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(AppLocalizations.of(context)!.selectsuccess); // Use selectsuccess property to get the localized string
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // No need to handle unfocus node here
        // FocusScope.of(context).requestFocus(FocusNode());
        // or
        // FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ClipRRect(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: ImageFetcher(
                        imageUrl: 'zomato/Z-2.PNG',
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.2),
                child: Text(
                  AppLocalizations.of(context)!.selectsuccess,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.05),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Zomato()), // Replace YourNextPage with the actual next page widget
                    );
                  },
                  child: Text(
                    "Back to main page",
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

  // @override
  // void dispose() {
  //   flutterTts.stop(); // Stop speaking when the widget is disposed
  //   super.dispose();
  // }
}
