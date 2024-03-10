import 'package:flutter/material.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/GoogleMaps/gm_main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GM5Widget extends StatefulWidget {
  const GM5Widget({Key? key}) : super(key: key);

  @override
  State<GM5Widget> createState() => _GM5WidgetState();
}

class _GM5WidgetState extends State<GM5Widget> {
  // late GM5Widget _model; // Not needed in this example

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // _model = GM5Widget(); // Not needed in this example
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
                    imageUrl: 'instagram_assets/gm2.jpeg',
                  ),
                ),
              ),
                ),
            
        
              Align(
                alignment: AlignmentDirectional(0, -0.25),
                child: Text(
                  AppLocalizations.of(context)!.locationsuccess,
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
                alignment: AlignmentDirectional(0, 0.05),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => GoogleMaps()), // Replace YourNextPage with the actual next page widget
                  );
                },
                child: Text(
                  "Back to main page",
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
