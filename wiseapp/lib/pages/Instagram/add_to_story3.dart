import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Addtostory3IgWidget extends StatefulWidget {
  const Addtostory3IgWidget({Key? key}) : super(key: key);

  @override
  State<Addtostory3IgWidget> createState() => _Addtostory3IgWidgetState();
}

class _Addtostory3IgWidgetState extends State<Addtostory3IgWidget> {
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
                  child:ImageFetcher(
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
                  'Use these to add text, music \nand gifs to your story',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 18,
                  ),
                ),
              ),
              Opacity(
                opacity: 0,
                child: Align(
                  alignment: AlignmentDirectional(-0.92, -0.9),
                  child: InkWell(
                    onTap: () async {
                      Navigator.pushNamed(context, 'ADDTOSTORY1_IG');
                    },
                    child: Icon(
                      Icons.settings_outlined,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.8,
                child: Align(
                  alignment: AlignmentDirectional(-1.76, 1.21),
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
              Opacity(
                opacity: 0,
                child: Align(
                  alignment: AlignmentDirectional(-0.64, 1),
                  child: InkWell(
                    onTap: () async {
                      Navigator.pushNamed(context, 'ADDTOSTORY4_IG');
                    },
                    child: Icon(
                      Icons.settings_outlined,
                      color: Colors.black,
                      size: 100,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.87, 0.8),
                child: Text(
                  'Click here to post story\nafter editing',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 18,
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
