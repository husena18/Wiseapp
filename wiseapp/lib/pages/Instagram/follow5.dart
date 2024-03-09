import 'package:flutter/material.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Instagram/Insta_main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Follow5IgWidget extends StatefulWidget {
  const Follow5IgWidget({Key? key}) : super(key: key);

  @override
  State<Follow5IgWidget> createState() => _Follow4IgWidgetState();
}

class _Follow4IgWidgetState extends State<Follow5IgWidget> {
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
                  imageUrl: 'instagram_assets/WhatsApp_Image_2024-02-28_at_23.25.21_(2).jpeg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InstaMain()),
                );
              },
              child: Align(
                alignment: Alignment(-0.80, 0.85),
                child: Icon(
                  Icons.arrow_forward,
                  color: Theme.of(context).primaryColor,
                  size: 70,
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
                  AppLocalizations.of(context)!.followed,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.merge(
                    TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
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
