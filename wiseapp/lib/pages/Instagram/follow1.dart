import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Instagram/follow2.dart';

class Follow1IgWidget extends StatefulWidget {
  const Follow1IgWidget({Key? key}) : super(key: key);

  @override
  State<Follow1IgWidget> createState() => _Follow1IgWidgetState();
}

class _Follow1IgWidgetState extends State<Follow1IgWidget>
    with TickerProviderStateMixin {
  late final FocusNode _unfocusNode;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _unfocusNode = FocusNode();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
      onTap: () {
        // Navigate to another page when animation is clicked
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Follow2IgWidget()),
        );
      },
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
                    imageUrl: 'instagram_assets/WhatsApp_Image_2024-02-28_at_23.28.01.jpeg',
                    width: 443,
                    height: 809,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Opacity(
                opacity: 0.8,
                child: Align(
                  alignment: Alignment(-1.43, 1.26),
                  child: Lottie.asset(
                    'assets/lottie_animations/cursor.json',
                    width: 285,
                    height: 254,
                    fit: BoxFit.fitWidth,
                    animate: true,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.51, 0.99),
                child: InkWell(
                  onTap: () async {
                    Navigator.of(context).pushNamed('FOLLOW2_IG');
                  },
                  child: Icon(
                    Icons.settings_outlined,
                    color: Theme.of(context).secondaryHeaderColor,
                    size: 70,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.53, 0.86),
                child: InkWell(
                  onTap: () async {},
                  child: Text(
                    'Click here',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.merge(
                          TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 22,
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
