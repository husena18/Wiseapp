import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Instagram/add_to_story2.dart';

class Addtostory1IgModel extends ChangeNotifier {
  late final FocusNode _unfocusNode;

  FocusNode get unfocusNode => _unfocusNode;

  Addtostory1IgModel() : _unfocusNode = FocusNode();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }
}

class Addtostory1IgWidget extends StatefulWidget {
  const Addtostory1IgWidget({Key? key}) : super(key: key);

  @override
  State<Addtostory1IgWidget> createState() => _Addtostory1IgWidgetState();
}

class _Addtostory1IgWidgetState extends State<Addtostory1IgWidget>
    with TickerProviderStateMixin {
  late Addtostory1IgModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = Addtostory1IgModel();
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
                    imageUrl: 'instagram_assets//WhatsApp_Image_2024-02-28_at_23.28.03.jpeg',
                  ),
                ),
              ),
            ),
            GestureDetector( // Wrap Lottie.asset with GestureDetector
  onTap: () {
    // Navigate to another page when animation is clicked
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Addtostory2IgWidget()),
    );
  },
  child: Opacity(
    opacity: 0.8,
    child: Align(
      alignment: AlignmentDirectional(-1.38, -0.96),
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
              alignment: AlignmentDirectional(-0.83, -0.53),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {},
                child: Text(
                  'Click Here',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontFamily: 'Readex Pro',
                    color: Colors.white, // Change text color to white
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
