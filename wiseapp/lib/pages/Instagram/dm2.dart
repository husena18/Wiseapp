import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Instagram/dm3.dart';

class Dm2IgWidget extends StatefulWidget {
  const Dm2IgWidget({Key? key}) : super(key: key);

  @override
  State<Dm2IgWidget> createState() => _Dm2IgWidgetState();
}

class _Dm2IgWidgetState extends State<Dm2IgWidget> {
  // late Dm2IgWidget _model; // Not needed in this example

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // _model = Dm2IgWidget(); // Not needed in this example
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'assets/images/WhatsApp_Image_2024-02-28_at_23.25.26.jpeg'
                        : 'assets/images/WhatsApp_Image_2024-02-28_at_23.25.29.jpeg',
                    width: 443,
                    height: 809,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Opacity(
                opacity: 0.8,
                child: Align(
                  alignment: AlignmentDirectional(3.12, -1.34),
                  child: Lottie.asset(
                    'assets/lottie_animations/Animation_-_1709196170491.json',
                    width: 285,
                    height: 254,
                    fit: BoxFit.fitWidth,
                    animate: true,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.71, -0.83),
                child: Text(
                  'Click here to\ntext someone new',
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

  // @override
  // void dispose() {
  //   _model.dispose(); // Not needed in this example
  //   super.dispose();
  // }
}
