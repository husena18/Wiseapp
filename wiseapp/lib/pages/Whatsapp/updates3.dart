import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Whatsapp/updates31.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Updates3Model extends ChangeNotifier {
  late final FocusNode _unfocusNode;

  FocusNode get unfocusNode => _unfocusNode;

  Updates3Model() : _unfocusNode = FocusNode();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }
}

class Updates3Widget extends StatefulWidget {
  const Updates3Widget({Key? key}) : super(key: key);

  @override
  State<Updates3Widget> createState() => _Updates3WidgetState();
}

class _Updates3WidgetState extends State<Updates3Widget>
    with TickerProviderStateMixin {
  late Updates3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    _model = Updates3Model();
    flutterTts = FlutterTts();
    dm(); // Call the method to speak the welcome text
  }

  Future<void> dm() async {
    await flutterTts.setLanguage('en');
    await flutterTts.setLanguage('hi');
    await flutterTts.setLanguage('gu');
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(AppLocalizations.of(context)!.searchselectfollow); // Use searchselectfollow property to get the localized string
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
                    imageUrl:
                     'whatsapp/statu41.jpg',
                  ),
                ),
              ),
                ),
            
        GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Updates31Widget()),
                );
              },
              child: Align(
                alignment: AlignmentDirectional(0, -0.2),
                child: Transform.rotate(
                  angle:0,
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
                alignment: AlignmentDirectional(-0, 0),
                child: Text(
                  AppLocalizations.of(context)!.editstory,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    color: Colors.white,
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