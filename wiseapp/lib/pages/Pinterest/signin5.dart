import 'package:flutter/material.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Pinterest/pint_main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class signin5Widget extends StatefulWidget {
  const signin5Widget({Key? key}) : super(key: key);

  @override
  State<signin5Widget> createState() => _signin5WidgetState();
}

class _signin5WidgetState extends State<signin5Widget> {
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
                alignment: Alignment.center,
                child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ClipRRect(
                  child: ImageFetcher(
                    imageUrl: 'instagram_assets/WhatsApp_Image_2024-02-28_at_23.25.21.jpeg',
                  ),
                ),
              ),
                ),
            
        
              Align(
                alignment: AlignmentDirectional(0.4, -0.55),
                child: Text(
                  AppLocalizations.of(context)!.nowfollow,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    color: Colors.white, 
                  ),
                ),
              ),
               Align(
                alignment: AlignmentDirectional(-0.07, 0.19),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Pinterest()), // Replace YourNextPage with the actual next page widget
                  );
                },
                child: Text(
                  "Let's explore other functionalities",
                  style: TextStyle(fontSize: 18),
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
