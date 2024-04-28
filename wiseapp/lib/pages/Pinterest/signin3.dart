import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Pinterest/signin4.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class signin3Widget extends StatefulWidget {
  const signin3Widget({Key? key}) : super(key: key);

  @override
  State<signin3Widget> createState() => _signin3WidgetState();
}

class _signin3WidgetState extends State<signin3Widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child:  ImageFetcher(
                    imageUrl: 'instagram_assets/WhatsApp_Image_2024-02-28_at_23.25.24.jpeg',
                  width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => signin4Widget()),
                );
              },
              child: Opacity(
                opacity: 0.8,
                child: Align(
                  alignment: Alignment(-0.80, -0.12),
                  child: Lottie.asset(
                    'animations/cursor.json',
                    width: 240,
                    height: 100,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.36, -0.86),
              child: InkWell(
                splashColor: Color.fromARGB(246, 0, 0, 0),
                focusColor: Color.fromARGB(246, 0, 0, 0),
                hoverColor: Colors.transparent,
                highlightColor: Color.fromARGB(246, 0, 0, 0),
                onTap: () async {},
                child: Text(
                  AppLocalizations.of(context)!.searchpeople,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.merge(
                        TextStyle(
                          fontFamily: 'Readex Pro',
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
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
