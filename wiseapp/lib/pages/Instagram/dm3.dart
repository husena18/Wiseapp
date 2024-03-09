import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Instagram/dm4.dart';

class Dm3IgWidget extends StatefulWidget {
  const Dm3IgWidget({Key? key}) : super(key: key);

  @override
  State<Dm3IgWidget> createState() => _Dm3IgWidgetState();
}

class _Dm3IgWidgetState extends State<Dm3IgWidget> {
  // late Dm3IgWidget _model; // Not needed in this example

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // _model = Dm3IgWidget(); // Not needed in this example
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
                    imageUrl:
                     'instagram_assets/WhatsApp_Image_2024-03-02_at_02.05.53.jpeg',
                  ),
                ),
              ),
                ),
            
        GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dm4IgWidget()),
                );
              },
              child: Align(
                alignment: AlignmentDirectional(-1.03, -0.74),
                child: Transform.rotate(
                  angle:0,
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
                alignment: AlignmentDirectional(-0.07, 0.29),
                child: Text(
                  'Search and select the person you want',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    color: Colors.white,
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
