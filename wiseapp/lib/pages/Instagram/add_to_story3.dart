import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Instagram/add_to_story4.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Addtostory3IgModel extends ChangeNotifier {
  late final FocusNode _unfocusNode;

  FocusNode get unfocusNode => _unfocusNode;

  Addtostory3IgModel() : _unfocusNode = FocusNode();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }
}

class Addtostory3IgWidget extends StatefulWidget {
  const Addtostory3IgWidget({Key? key}) : super(key: key);

  @override
  State<Addtostory3IgWidget> createState() => _Addtostory3IgWidgetState();
}

class _Addtostory3IgWidgetState extends State<Addtostory3IgWidget>
    with TickerProviderStateMixin {
  late Addtostory3IgModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    _model = Addtostory3IgModel();
    flutterTts = FlutterTts();
    addtostory(); // Call the method to speak the welcome text
  }

  Future<void> addtostory() async {
    await flutterTts.setLanguage('en');
    await flutterTts.setPitch(1.0);
    await flutterTts.speak('Click on the settings icon to edit your story and click on the cursor to post your story');
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  borderRadius: BorderRadius.circular(8),
                  child: ImageFetcher(
                    imageUrl: 'instagram_assets/WhatsApp_Image_2024-02-28_at_23.25.40.jpeg',
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Icon(
                Icons.settings_outlined,
                color: Colors.black,
                size: 24,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.76, -0.82),
              child: Text(
                AppLocalizations.of(context)!.editstory,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Addtostory4IgWidget()),
                );
              },
              child: Align(
                alignment: AlignmentDirectional(-1.16, 1.11),
                child: Opacity(
                  opacity: 0.8,
                  child: Transform.rotate(
                    angle: 3,
                    child: Lottie.asset(
                      'animations/cursor.json',
                      width: 185,
                      height: 154,
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
              alignment: AlignmentDirectional(-0.27, 0.8),
              child: Text(
                AppLocalizations.of(context)!.poststory,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
