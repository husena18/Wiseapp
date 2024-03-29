import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Instagram/dm3.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_tts/flutter_tts.dart';

class Dm2IgModel extends ChangeNotifier {
  late final FocusNode _unfocusNode;

  FocusNode get unfocusNode => _unfocusNode;

  Dm2IgModel() : _unfocusNode = FocusNode();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }
}

class Dm2IgWidget extends StatefulWidget {
  const Dm2IgWidget({Key? key}) : super(key: key);

  @override
  State<Dm2IgWidget> createState() => _Dm2IgWidgetState();
}

class _Dm2IgWidgetState extends State<Dm2IgWidget>
    with TickerProviderStateMixin {
  late Dm2IgModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    _model = Dm2IgModel();
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
                    imageUrl: 'instagram_assets/WhatsApp_Image_2024-02-28_at_23.25.29.jpeg',
                  ),
                ),
              ),
                ),
            
        GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dm3IgWidget()),
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
