import 'package:flutter/material.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Instagram/Insta_main.dart';


class Dm4IgWidget extends StatefulWidget {
  const Dm4IgWidget({Key? key}) : super(key: key);

  @override
  State<Dm4IgWidget> createState() => _Dm4IgWidgetState();
}

class _Dm4IgWidgetState extends State<Dm4IgWidget> {
  // late Dm4IgWidget _model; // Not needed in this example

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // _model = Dm4IgWidget(); // Not needed in this example
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // No need to handle unfocus node here
        // FocusScope.of(context).requestFocus(FocusNode());
        // or
        // FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ClipRRect(
                  child: ImageFetcher(
                    imageUrl: 'instagram_assets/WhatsApp_Image_2024-03-02_at_02.10.02.jpeg',
                  ),
                ),
              ),
                ),
            
        
              Align(
                alignment: AlignmentDirectional(-0.07, 0.09),
                child: Text(
                  'You can now chat with your friends',
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
                    MaterialPageRoute(builder: (context) => InstaMain()), // Replace YourNextPage with the actual next page widget
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

  // @override
  // void dispose() {
  //   _model.dispose(); // Not needed in this example
  //   super.dispose();
  // }
}
