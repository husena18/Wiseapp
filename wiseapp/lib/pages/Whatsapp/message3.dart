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

  // @override
  // void dispose() {
  //   flutterTts.stop(); // Stop speaking when the widget is disposed
  //   super.dispose();
  // }
}
