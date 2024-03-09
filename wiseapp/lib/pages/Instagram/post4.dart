import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/pages/Instagram/post5.dart'; // Import the correct next page widget
import 'package:wiseapp/image_fetch.dart';

class Post4IgWidget extends StatefulWidget {
  const Post4IgWidget({Key? key}) : super(key: key);

  @override
  State<Post4IgWidget> createState() => _Post4IgWidgetState();
}

class _Post4IgWidgetState extends State<Post4IgWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // On page load action.
    SchedulerBinding.instance!.addPostFrameCallback((_) async {
      Navigator.of(context).pushNamed('POST4_IG');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ClipRRect(
                    child: ImageFetcher(
                      imageUrl: 'instagram_assets/WhatsApp_Image_2024-02-28_at_23.15.31.jpeg',
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to another page when animation is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Post5IgWidget()),
                  );
                },
                child: Opacity(
                  opacity: 0.8,
                  child: Align(
                    alignment: AlignmentDirectional(0.25, 1.09),
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
              Opacity(
                opacity: 0,
                child: Align(
                  alignment: AlignmentDirectional(-0.97, -0.79),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      // Handle onTap
                    },
                    child: Icon(
                      Icons.settings_outlined,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      size: 100,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.06, 0.93),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {},
                  child: Text(
                    'Click here once you\n are ready to post',
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
      ),
    );
  }
}
