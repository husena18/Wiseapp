import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Pinterest/log3.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_tts/flutter_tts.dart';

class log2Model extends ChangeNotifier {
  late final FocusNode _unfocusNode;

  FocusNode get unfocusNode => _unfocusNode;

  log2Model() : _unfocusNode = FocusNode();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }
}

class log2Widget extends StatefulWidget {
  const log2Widget({Key? key}) : super(key: key);

  @override
  State<log2Widget> createState() => _log2WidgetState();
}

class _log2WidgetState extends State<log2Widget>
    with TickerProviderStateMixin {
  late log2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    _model = log2Model();
    flutterTts = FlutterTts();
    dm(); // Call the method to speak the welcome text
  }

Future<void> dm() async {
  await flutterTts.setLanguage('en');
  await flutterTts.setLanguage('hi');
  await flutterTts.setLanguage('gu');
  await flutterTts.setPitch(1.0);
  await flutterTts.speak(AppLocalizations.of(context)!.chtsm); // Use chdm property to get the localized string
}

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
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
                  child: ImageFetcher(
                    imageUrl: 'Pinterest/L1_D.jpeg',
                  ),
                ),
              ),
                ),
            
        GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => log3Widget()),
                );
              },
              child: Align(
                alignment: AlignmentDirectional(1.67, -1.14),
                child: Transform.rotate(
                  angle: 1.3,
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
                alignment: AlignmentDirectional(0.71, -0.53),
                child: Text(
                  AppLocalizations.of(context)!.newmessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
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
  //   _model.dispose(); // Not needed in this example
  //   super.dispose();
  // }
}
