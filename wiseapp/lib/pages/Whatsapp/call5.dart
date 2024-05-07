import 'package:flutter/material.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Whatsapp/Whatsapp_main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
 // Change post6.dart to the next post file if necessary

class Call5Widget extends StatelessWidget {
  const Call5Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ClipRRect(
                    child: ImageFetcher(
                      imageUrl: 'whatsapp/call1.jpg',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.6),
                child: Text(
                  AppLocalizations.of(context)!.successlearn,
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
                      MaterialPageRoute(builder: (context) => Whatsapp()), 
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
}
