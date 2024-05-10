import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Whatsapp/call2.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Call1Widget extends StatefulWidget {
  const Call1Widget({Key? key}) : super(key: key);

  @override
  State<Call1Widget> createState() => _Call1WidgetState();
}

class _Call1WidgetState extends State<Call1Widget> {
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
                    imageUrl: 'whatsapp/status2.jpg',
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Call2Widget()),
                );
              },
              child: Align(
                alignment: AlignmentDirectional(-1.94, 1.1),
                child: Transform.rotate(
                  angle: 3,
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
              alignment: Alignment(-0.39, 0.82),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'DM2_IG');
                },
                child: Text(
                  AppLocalizations.of(context)!.clickhere,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 26,
                    color: Colors.white,
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
