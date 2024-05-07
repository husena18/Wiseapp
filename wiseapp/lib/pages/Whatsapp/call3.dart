import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/pages/Whatsapp/call4.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Call3Widget extends StatelessWidget {
  const Call3Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ClipRRect(
                  child: ImageFetcher(
                    imageUrl: 'whatsapp/call2.jpg',
                  ),
                ),
              ),
              
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Call4Widget()),
                );
              },
              child: Opacity(
                opacity: 0.8,
                child: Align(
                  alignment: AlignmentDirectional(0, -0.8),
                  child: Transform.rotate(
                  angle: 0,
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
            ),
            Align(
              alignment: AlignmentDirectional(0, -0.8),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {},
                child: Text(
                  AppLocalizations.of(context)!.searchhere,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontFamily: 'Readex Pro',
                    color: Colors.white, // Change text color to white
                    fontSize: 26,
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
