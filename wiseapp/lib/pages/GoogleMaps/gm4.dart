import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/GoogleMaps/gm5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class GM4Model extends ChangeNotifier {
  late final FocusNode _unfocusNode;

  FocusNode get unfocusNode => _unfocusNode;

  GM4Model() : _unfocusNode = FocusNode();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }
}

class GM4Widget extends StatefulWidget {
  const GM4Widget({Key? key}) : super(key: key);

  @override
  State<GM4Widget> createState() => _GM4WidgetState();
}

class _GM4WidgetState extends State<GM4Widget>
    with TickerProviderStateMixin {
  late GM4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = GM4Model();
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
                    imageUrl: 'instagram_assets/gm1.jpeg',
                  ),
                ),
              ),
            ),
            GestureDetector( // Wrap Lottie.asset with GestureDetector
  onTap: () {
    // Navigate to another page when animation is clicked
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GM5Widget()),
    );
  },
  child: Opacity(
    opacity: 0.8,
    child: Align(
      alignment: AlignmentDirectional(-1.05, 1.15),
      child: Transform.rotate
      (angle: 4.5,
      child: Lottie.asset(
        'animations/cursor.json',
        width: 250,
        height: 220,
        reverse: true,
        repeat: true,
        fit: BoxFit.fitWidth,
        animate: true,
      ),
      )
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
                  AppLocalizations.of(context)!.clickhere,
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
