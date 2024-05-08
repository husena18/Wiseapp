import 'package:flutter/material.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Whatsapp/Whatsapp_main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Message4Model extends ChangeNotifier {
  late final FocusNode _unfocusNode;

  FocusNode get unfocusNode => _unfocusNode;

  Message4Model() : _unfocusNode = FocusNode();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }
}

class Message4Widget extends StatefulWidget {
  const Message4Widget({Key? key}) : super(key: key);

  @override
  State<Message4Widget> createState() => _Message4WidgetState();
}

class _Message4WidgetState extends State<Message4Widget>
    with TickerProviderStateMixin {
  late Message4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    _model = Message4Model();
    flutterTts = FlutterTts();
    addtostory(); // Call the method to speak the welcome text
  }

  Future<void> addtostory() async {
    await flutterTts.setLanguage('en');
    await flutterTts.setPitch(1.0);
    await flutterTts.speak('Your story has been uploaded, You can now explore other functionalities');
  }

  @override
  void dispose() {
    _model.dispose();
    flutterTts.stop(); // Stop speaking when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Change to the desired background color
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.center,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ImageFetcher(
                    imageUrl: 'instagram_assets/WhatsApp_Image_2024-02-28_at_23.25.39_(1).jpeg',
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, -0.1),
              child: Text(
                AppLocalizations.of(context)!.storyuploaded,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Change to the desired text color
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
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
    );
  }
}
