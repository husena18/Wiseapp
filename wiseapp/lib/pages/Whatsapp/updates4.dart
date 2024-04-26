import 'package:flutter/material.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Whatsapp/Whatsapp_main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Updates4Model extends ChangeNotifier {
  late final FocusNode _unfocusNode;

  FocusNode get unfocusNode => _unfocusNode;

  Updates4Model() : _unfocusNode = FocusNode();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }
}

class Updates4Widget extends StatefulWidget {
  const Updates4Widget({Key? key}) : super(key: key);

  @override
  State<Updates4Widget> createState() => _Updates4WidgetState();
}

class _Updates4WidgetState extends State<Updates4Widget>
    with TickerProviderStateMixin {
  late Updates4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    _model = Updates4Model();
    flutterTts = FlutterTts();
    dm(); // Call the method to speak the welcome text
  }

 Future<void> dm() async {
  await flutterTts.setLanguage('en');
  await flutterTts.setLanguage('hi');
  await flutterTts.setLanguage('gu');
  await flutterTts.setPitch(1.0);
  await flutterTts.speak(AppLocalizations.of(context)!.fnf); // Use chdm property to get the localized string
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
                    imageUrl: 'instagram_assets/WhatsApp_Image_2024-03-02_at_02.10.02.jpeg',
                  ),
                ),
              ),
                ),
            
        
              Align(
                alignment: AlignmentDirectional(-0.07, 0.09),
                child: Text(
                  AppLocalizations.of(context)!.chatwithfriends,
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
                    MaterialPageRoute(builder: (context) => Whatsapp()), // Replace YourNextPage with the actual next page widget
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

  // @override
  // void dispose() {
  //   _model.dispose(); // Not needed in this example
  //   super.dispose();
  // }
}
