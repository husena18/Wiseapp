import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/pages/Whatsapp/call5.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Call4Widget extends StatefulWidget {
  const Call4Widget({Key? key}) : super(key: key);

  @override
  State<Call4Widget> createState() => _Call4WidgetState();
}

class _Call4WidgetState extends State<Call4Widget> {
  late FlutterTts flutterTts;
  late FocusNode _unfocusNode;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    _unfocusNode = FocusNode();
    addVoiceCommand(); // Call the method to speak the voice command
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  Future<void> addVoiceCommand() async {
    await flutterTts.setLanguage('en');
    await flutterTts.setLanguage('hi');
    await flutterTts.setLanguage('gu');
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(AppLocalizations.of(context)!.selectsuccess);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ClipRRect(
                  child: ImageFetcher(
                    imageUrl: 'whatsapp/call6.jpg',
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Call5Widget()),
                );
              },
              child: Opacity(
                opacity: 0.8,
                child: Align(
                  alignment: AlignmentDirectional(0.5, -0.8),
                  child: Transform.rotate(
                    angle: 2,
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
            ),
            Align(
              alignment: AlignmentDirectional(0.55, -0.5),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {},
                child: Text(
                  AppLocalizations.of(context)!.clickhere,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontFamily: 'Readex Pro',
                    color: Colors.white, // Change text color to white
                    fontSize: 26,
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
