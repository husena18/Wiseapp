import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wiseapp/pages/Whatsapp/message2.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Message1Model extends ChangeNotifier {
  late final FocusNode _unfocusNode;

  FocusNode get unfocusNode => _unfocusNode;

  Message1Model() : _unfocusNode = FocusNode();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }
}

class Message1Widget extends StatefulWidget {
  const Message1Widget({Key? key}) : super(key: key);

  @override
  State<Message1Widget> createState() => _Message1WidgetState();
}

class _Message1WidgetState extends State<Message1Widget>
    with TickerProviderStateMixin {
  late Message1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    _model = Message1Model();
    flutterTts = FlutterTts();
    addtostory(); // Call the method to speak the welcome text
  }

  Future<void> addtostory() async {
    await flutterTts.setLanguage('en');
    await flutterTts.setPitch(1.0);
    await flutterTts.speak('Use your camera to click a photo or select from your gallery!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
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
                    imageUrl: 'whatsapp/pic1.jpg',
                  ),
                ),
              ),
            ),
  
          GestureDetector( // Wrap Lottie.asset with GestureDetector
  onTap: () {
    // Navigate to another page when animation is clicked
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Message2Widget()),
    );
  },
  child: Opacity(
    opacity: 0.8,
    child: Align(
      alignment: AlignmentDirectional(0.93, 1),
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
),

            Opacity(
              opacity: 0,
              child: Align(
                alignment: AlignmentDirectional(-0.97, -0.9),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    // Handle onTap
                  },
                  child: Icon(
                    Icons.settings_outlined,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    size: 100,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.43, 0.7),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {},
                child: Text(
                  AppLocalizations.of(context)!.clickherecam,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontFamily: 'Readex Pro',
                    // Change text color to white
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

  // @override
  // void dispose() {
  //   flutterTts.stop(); // Stop speaking when the widget is disposed
  //   super.dispose();
  
}
