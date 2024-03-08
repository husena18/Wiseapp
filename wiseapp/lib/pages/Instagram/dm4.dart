import 'package:flutter/material.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Instagram/Insta_main.dart';

class Dm4IgWidget extends StatefulWidget {
  const Dm4IgWidget({Key? key}) : super(key: key);

  @override
  State<Dm4IgWidget> createState() => _Dm4IgWidgetState();
}

class _Dm4IgWidgetState extends State<Dm4IgWidget> {
  // late Dm4IgWidget _model; // Not needed in this example

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // _model = Dm4IgWidget(); // Not needed in this example
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
                alignment: AlignmentDirectional(0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'assets/images/WhatsApp_Image_2024-03-02_at_02.10.02.jpeg'
                        : 'assets/images/WhatsApp_Image_2024-03-02_at_02.10.05.jpeg',
                    width: 443,
                    height: 809,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.03, 0.28),
                child: Text(
                  'You can now chat with your friends',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 20,
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
