import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/pages/Instagram/Insta_main.dart'; // Change post6.dart to the next post file if necessary
import 'package:wiseapp/image_fetch.dart';

class Post5IgWidget extends StatefulWidget {
  const Post5IgWidget({Key? key}) : super(key: key);

  @override
  State<Post5IgWidget> createState() => _Post5IgWidgetState();
}

class _Post5IgWidgetState extends State<Post5IgWidget> {
  late Post5IgWidget _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = Post5IgWidget();

    // On page load action.
    SchedulerBinding.instance!.addPostFrameCallback((_) async {
      Navigator.of(context).pushNamed('POST5_IG');
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        key: scaffoldKey,
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
                      imageUrl: 'instagram_assets/WhatsApp_Image_2024-02-28_at_23.15.31_(1).jpeg',
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
