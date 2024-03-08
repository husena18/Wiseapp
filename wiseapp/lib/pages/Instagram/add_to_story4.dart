import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wiseapp/image_fetch.dart';

class Addtostory4IgWidget extends StatefulWidget {
  const Addtostory4IgWidget({Key? key}) : super(key: key);

  @override
  State<Addtostory4IgWidget> createState() => _Addtostory4IgWidgetState();
}

class _Addtostory4IgWidgetState extends State<Addtostory4IgWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        backgroundColor: Colors.white, // Change to the desired background color
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.center,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: ImageFetcher(
                      imageUrl: 'instagram_assets/WhatsApp_Image_2024-02-28_at_23.25.39_(1).jpeg',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.57, -0.92),
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
              Align(
                alignment: AlignmentDirectional(-0.9, -0.6),
                child: Text(
                  'Story uploaded',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Change to the desired text color
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
