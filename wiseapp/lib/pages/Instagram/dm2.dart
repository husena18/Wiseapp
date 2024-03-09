import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Instagram/dm3.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ClipRRect(
                  child: ImageFetcher(
                    imageUrl: 'instagram_assets/WhatsApp_Image_2024-02-28_at_23.25.29.jpeg',
                  ),
                ),
              ),
                ),
            
        GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dm3IgWidget()),
                );
              },
              child: Align(
                alignment: AlignmentDirectional(1.67, -1.14),
                child: Transform.rotate(
                  angle: 1.3,
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
                alignment: AlignmentDirectional(0.71, -0.53),
                child: Text(
                  AppLocalizations.of(context)!.newmessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
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
