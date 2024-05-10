import 'package:flutter/material.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Whatsapp/Whatsapp_main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Call5Widget extends StatefulWidget {
  const Call5Widget({Key? key}) : super(key: key);

  @override
  State<Call5Widget> createState() => _Call5WidgetState();
}

class _Call5WidgetState extends State<Call5Widget> {
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
                      imageUrl: 'whatsapp/call1.jpg',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.6),
                child: Text(
                  AppLocalizations.of(context)!.successlearn,
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
                      MaterialPageRoute(builder: (context) => Whatsapp()), 
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
