import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Whatsapp/updates2.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Updates1Model extends ChangeNotifier {
  late final FocusNode _unfocusNode;

  FocusNode get unfocusNode => _unfocusNode;

  Updates1Model() : _unfocusNode = FocusNode();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }
}

class Updates1Widget extends StatefulWidget {
  const Updates1Widget({Key? key}) : super(key: key);

  @override
  State<Updates1Widget> createState() => _Updates1WidgetState();
}

class _Updates1WidgetState extends State<Updates1Widget>
    with TickerProviderStateMixin {
  late Updates1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    _model = Updates1Model();
    flutterTts = FlutterTts();
    dm(); // Call the method to speak the welcome text
  }

Future<void> dm() async {
  await flutterTts.setLanguage('en');
  await flutterTts.setLanguage('hi');
  await flutterTts.setLanguage('gu');
  await flutterTts.setPitch(1.0);
  await flutterTts.speak(AppLocalizations.of(context)!.chdm); // Use chdm property to get the localized string
}

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
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
                    imageUrl: 'whatsapp/call4.jpg',
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Updates2Widget()),
                );
              },
              child: Align(
                alignment: AlignmentDirectional(-1.8, 0.9),
                child: Transform.rotate(
                  angle: 4,
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
              alignment: Alignment(-0.61, 0.76),
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
