import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Pinterest/signin3.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class signin2Widget extends StatefulWidget {
  const signin2Widget({Key? key}) : super(key: key);

  @override
  State<signin2Widget> createState() => _signin2WidgetState();
}

class _signin2WidgetState extends State<signin2Widget>
    with TickerProviderStateMixin {
  late final FocusNode _unfocusNode = FocusNode();
  late final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ImageFetcher(
                    imageUrl: 'Pinterest/SU1_D.jpeg',
                    width: 443,
                    height: 809,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Opacity(
                opacity: 0.8,
                child: Align(
                  alignment: Alignment(-0.73, -1.1),
                  child: Lottie.asset(
                    'animations/cursor.json',
                    width: 200,
                    height: 140,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Opacity(
                opacity: 0,
                child: Align(
                  alignment: Alignment(-0.71, -0.95),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => signin3Widget()),
                );
                    },
                    child: Icon(
                      Icons.settings_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 70,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.36, -0.66),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Color.fromARGB(125, 76, 72, 72),
                  onTap: () async {},
                  child: Text(
                    AppLocalizations.of(context)!.searchpeople,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.merge(
                          TextStyle(
                            fontFamily: 'Times New Roman',
                            color:Color.fromARGB(214, 6, 4, 4),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
