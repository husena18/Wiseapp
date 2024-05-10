import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wiseapp/pages/Whatsapp/Message4.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Message3Model extends ChangeNotifier {
  late final FocusNode _unfocusNode;

  FocusNode get unfocusNode => _unfocusNode;

  Message3Model() : _unfocusNode = FocusNode();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }
}

class Message3Widget extends StatefulWidget {
  const Message3Widget({Key? key}) : super(key: key);

  @override
  State<Message3Widget> createState() => _Message3WidgetState();
}

class _Message3WidgetState extends State<Message3Widget>
    with TickerProviderStateMixin {
  late Message3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    _model = Message3Model();
    flutterTts = FlutterTts();
    addtostory(); // Call the method to speak the welcome text
  }

  Future<void> addtostory() async {
    await flutterTts.setLanguage('en');
    await flutterTts.setLanguage('hi');
    await flutterTts.setLanguage('gu');
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(AppLocalizations.of(context)!.selectsuccess);
  }

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
                    imageUrl: 'whatsapp/picsend1.jpg',
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Message4Widget()),
                );
              },
              child: Opacity(
                opacity: 0.8,
                child: Align(
                  alignment: AlignmentDirectional(1.4, 0.98),
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
            Align(
              alignment: AlignmentDirectional(0.01, 0.7),
              child: InkWell(
                onTap: () async {
                  // Handle onTap
                },
                child: Text(
                  AppLocalizations.of(context)!.chdm,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, -0.8),
              child: InkWell(
                onTap: () async {
                  // Handle onTap
                },
                child: Text(
                  AppLocalizations.of(context)!.editstory,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Colors.black,
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

  // @override
  // void dispose() {
  //   flutterTts.stop(); // Stop speaking when the widget is disposed
  //   super.dispose();
  // }
}
