import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/pages/Instagram/add_to_story1.dart';

class Addtostory2IgWidget extends StatefulWidget {
  const Addtostory2IgWidget({Key? key}) : super(key: key);

  @override
  State<Addtostory2IgWidget> createState() => _Addtostory2IgWidgetState();
}

class _Addtostory2IgWidgetState extends State<Addtostory2IgWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/WhatsApp_Image_2024-02-28_at_23.25.40_(1).jpeg',
                  width: 435,
                  height: 825,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Opacity(
              opacity: 0.8,
              child: Align(
                alignment: AlignmentDirectional(0, 0.43),
                child: Lottie.asset(
                  'assets/lottie_animations/Animation_-_1709196170491.json',
                  width: 398,
                  height: 440,
                  fit: BoxFit.fitWidth,
                  animate: true,
                )
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.01, -0.79),
              child: InkWell(
                onTap: () async {
                  // Handle onTap
                },
                child: Text(
                  'Use your camera to \nclick a photo or select\n from your gallery',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Colors.black,
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
}
