import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Whatsapp/linkd5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Linkd4Widget extends StatefulWidget {
  const Linkd4Widget({Key? key}) : super(key: key);

  @override
  State<Linkd4Widget> createState() => _Linkd4WidgetState();
}

class _Linkd4WidgetState extends State<Linkd4Widget> {
  late FlutterTts flutterTts;
  late FocusNode _unfocusNode;
  late GlobalKey<ScaffoldState> scaffoldKey;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    _unfocusNode = FocusNode();
    scaffoldKey = GlobalKey<ScaffoldState>();
    addVoiceCommand(); // Call the method to speak the voice command
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  Future<void> addVoiceCommand() async {
    await flutterTts.setLanguage('en');
    await flutterTts.setPitch(1.0);
    await flutterTts.speak('Tap the image to proceed to the next screen!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ImageFetcher(
                  imageUrl: 'instagram_assets/WhatsApp_Image_2024-02-28_at_23.25.22.jpeg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Linkd5Widget()),
                );
              },
              child: Opacity(
                opacity: 0.8,
                child: Align(
                  alignment: Alignment(-0.4, -0.45),
                  child: Lottie.asset(
                    'animations/cursor.json',
                    width: 240,
                    height: 100,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.36, -0.86),
              child: InkWell(
                splashColor: Color.fromARGB(246, 0, 0, 0),
                focusColor: Color.fromARGB(246, 0, 0, 0),
                hoverColor: Colors.transparent,
                highlightColor: Color.fromARGB(246, 0, 0, 0),
                onTap: () async {},
                child: Text(
                  AppLocalizations.of(context)!.followhere,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.merge(
                    TextStyle(
                      fontFamily: 'Readex Pro',
                      color: const Color.fromARGB(243, 0, 0, 0),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
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
