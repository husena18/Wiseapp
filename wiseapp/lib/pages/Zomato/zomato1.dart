import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Zomato/zomato2.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Zomato1Model extends ChangeNotifier {
  late final FocusNode _unfocusNode;

  FocusNode get unfocusNode => _unfocusNode;

  Zomato1Model() : _unfocusNode = FocusNode();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }
}

class Zomato1Widget extends StatefulWidget {
  const Zomato1Widget({Key? key}) : super(key: key);

  @override
  State<Zomato1Widget> createState() => _Zomato1WidgetState();
}

class _Zomato1WidgetState extends State<Zomato1Widget>
    with TickerProviderStateMixin {
  late Zomato1Model _model;
  late FlutterTts flutterTts;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = Zomato1Model();
    flutterTts = FlutterTts();
    addVoiceCommand(); // Call the method to speak the welcome text
  }

  Future<void> addVoiceCommand() async {
    await flutterTts.setLanguage('en');
    await flutterTts.setLanguage('hi');
    await flutterTts.setLanguage('gu');
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(AppLocalizations.of(context)!.clickhere); // Use clickhere property to get the localized string
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
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
                    imageUrl: 'zomato/Z-2.PNG',
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to another page when animation is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Zomato2Widget()),
                );
              },
              child: Opacity(
                opacity: 0.8,
                child: Align(
                  alignment: AlignmentDirectional(-1.3, 0),
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
            Opacity(
              opacity: 0,
              child: Align(
                alignment: AlignmentDirectional(-0.97, -0.79),
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
              alignment: AlignmentDirectional(-0.83, -0.15),
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
                        color: Colors.black, // Change text color to white
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
