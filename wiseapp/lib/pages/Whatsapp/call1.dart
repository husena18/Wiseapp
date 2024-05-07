import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Whatsapp/call2.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Call1Widget extends StatelessWidget {
  const Call1Widget({Key? key}) : super(key: key);

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
                    imageUrl: 'whatsapp/status2.jpg',
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Call2Widget()),
                );
              },
              child: Align(
                alignment: AlignmentDirectional(-1.94, 1.1),
                child: Transform.rotate(
                  angle: 3,
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
              alignment: Alignment(-0.39, 0.82),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'DM2_IG');
                },
                child: Text(
                  AppLocalizations.of(context)!.clickhere,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 26,
                    color: Colors.white,
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
