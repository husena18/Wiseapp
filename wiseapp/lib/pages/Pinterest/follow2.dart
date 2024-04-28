import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wiseapp/pages/Pinterest/follow3.dart';
import 'package:flutter_tts/flutter_tts.dart';

class follow2Model extends ChangeNotifier {
  late final FocusNode _unfocusNode;

  FocusNode get unfocusNode => _unfocusNode;

  follow2Model() : _unfocusNode = FocusNode();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }
}

class follow2Widget extends StatefulWidget {
  const follow2Widget({Key? key}) : super(key: key);

  @override
  State<follow2Widget> createState() => _follow2WidgetState();
}

class _follow2WidgetState extends State<follow2Widget>
    with TickerProviderStateMixin {
  late follow2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    _model = follow2Model();
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
                    imageUrl: 'instagram_assets/WhatsApp_Image_2024-02-28_at_23.25.40_(1).jpeg',
                  ),
                ),
              ),
            ),
            GestureDetector( // Wrap Lottie.asset with GestureDetector
              onTap: () {
                Navigator.push( // Navigate to another page when animation is clicked
                  context,
                  MaterialPageRoute(builder: (context) => follow3Widget()), // Replace DestinationPage with your destination page
                );
              },
              child: Opacity(
                opacity: 0.8,
                child: Align(
                  alignment: AlignmentDirectional(0.3, 0.43),
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
              alignment: AlignmentDirectional(0.01, -0.79),
              child: InkWell(
                onTap: () async {
                  // Handle onTap
                },
                child: Text(
                  AppLocalizations.of(context)!.fromgallery,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
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
}