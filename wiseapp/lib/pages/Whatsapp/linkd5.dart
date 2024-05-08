import 'package:flutter/material.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Whatsapp/Whatsapp_main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Linkd5Widget extends StatefulWidget {
  const Linkd5Widget({Key? key}) : super(key: key);

  @override
  State<Linkd5Widget> createState() => _Linkd5WidgetState();
}

class _Linkd5WidgetState extends State<Linkd5Widget> {
  late FlutterTts flutterTts;
  late GlobalKey<ScaffoldState> scaffoldKey;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    scaffoldKey = GlobalKey<ScaffoldState>();
    addVoiceCommand(); // Call the method to speak the voice command
  }

  Future<void> addVoiceCommand() async {
    await flutterTts.setLanguage('en');
    await flutterTts.setPitch(1.0);
    await flutterTts.speak("You're now following this link!");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                    child: ImageFetcher(
                      imageUrl: 'instagram_assets/WhatsApp_Image_2024-02-28_at_23.25.21.jpeg',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.4, -0.55),
                child: Text(
                  AppLocalizations.of(context)!.nowfollow,
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

//   @override
//   void dispose() {
//     flutterTts.stop(); // Stop speaking when the widget is disposed
//     super.dispose();
//   }
}
