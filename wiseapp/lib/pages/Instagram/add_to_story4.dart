import 'package:flutter/material.dart';
import 'package:wiseapp/image_fetch.dart';


class Addtostory4IgWidget extends StatefulWidget {
  const Addtostory4IgWidget({Key? key}) : super(key: key);

  @override
  State<Addtostory4IgWidget> createState() => _Addtostory4IgWidgetState();
}

class _Addtostory4IgWidgetState extends State<Addtostory4IgWidget>
    with TickerProviderStateMixin {
  late FocusNode _unfocusNode;

  @override
  void initState() {
    super.initState();
    _unfocusNode = FocusNode();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_unfocusNode.canRequestFocus) {
          FocusScope.of(context).requestFocus(_unfocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Opacity(
                opacity: 0,
                child: Align(
                  alignment: Alignment(0.01, 0.7),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.of(context).pushNamed('ADDTOSTORY4_IG');
                    },
                    child: Icon(
                      Icons.settings_outlined,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      size: 50,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(0, 0.37),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: ImageFetcher(
                                imageUrl: ('instagram_assets/WhatsApp_Image_2024-02-28_at_23.25.40.jpeg'),
                          width: 432,
                          height: 753,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0,
                      child: Align(
                        alignment: Alignment(-0.99, -0.67),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {},
                          child: Icon(
                            Icons.settings_outlined,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            size: 100,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Opacity(
                opacity: 0.8,
                child: Align(
                  alignment: Alignment(-2.67, -0.92),
                  child: Image.asset(
                    'assets/lottie_animations/Animation_-_1709196170491.json',
                    width: 285,
                    height: 254,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.79, -0.61),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {},
                  child: Text(
                    'story uploaded',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
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
