import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';


class Follow2IgWidget extends StatefulWidget {
  const Follow2IgWidget({Key? key}) : super(key: key);

  @override
  State<Follow2IgWidget> createState() => _Follow2IgWidgetState();
}

class _Follow2IgWidgetState extends State<Follow2IgWidget>
    with TickerProviderStateMixin {
  late Follow2IgModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: Duration.zero,
          duration: Duration(milliseconds: 1240),
          begin: Offset(1, 1),
          end: Offset(1.5, 1.5),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Follow2IgModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'assets/images/WhatsApp_Image_2024-02-28_at_23.25.25_(1).jpeg'
                        : 'assets/images/WhatsApp_Image_2024-02-28_at_23.25.25.jpeg',
                    width: 443,
                    height: 809,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Opacity(
                opacity: 0.8,
                child: Align(
                  alignment: Alignment(-4.64, -1.52),
                  child: Lottie.asset(
                    'assets/lottie_animations/Animation_-_1709196170491.json',
                    width: 343,
                    height: 346,
                    fit: BoxFit.fitWidth,
                    animate: true,
                  ),
                ),
              ),
              Opacity(
                opacity: 0,
                child: Align(
                  alignment: Alignment(-0.71, -0.95),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.of(context).pushNamed('FOLLOW3_IG');
                    },
                    child: Icon(
                      Icons.settings_outlined,
                      color: Theme.of(context).accentColor,
                      size: 70,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.36, -0.86),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {},
                  child: Text(
                    'Search the person you want to follow',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.merge(
                          TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                          ),
                        ),
                  ),
                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
