import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Addtostory1IgModel extends ChangeNotifier {
  late FocusNode _unfocusNode;

  FocusNode get unfocusNode => _unfocusNode;

  Addtostory1IgModel() {
    _unfocusNode = FocusNode();
  }

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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'assets/images/WhatsApp_Image_2024-02-28_at_23.28.03.jpeg'
                        : 'assets/images/WhatsApp_Image_2024-02-28_at_23.28.01.jpeg',
                    width: 443,
                    height: 809,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Opacity(
                opacity: 0.8,
                child: Align(
                  alignment: AlignmentDirectional(-2.67, -1.07),
                  child: Lottie.asset(
                    'assets/lottie_animations/Animation_-_1709196170491.json',
                    width: 285,
                    height: 254,
                    fit: BoxFit.fitWidth,
                    animate: true,
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
                    'Click here',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontFamily: 'Readex Pro',
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}