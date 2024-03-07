import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_to_story1.dart'; 

class InstagramIgWidget extends StatefulWidget {
  const InstagramIgWidget({Key? key}) : super(key: key);

  @override
  State<InstagramIgWidget> createState() => _InstagramIgWidgetState();
}

class _InstagramIgWidgetState extends State<InstagramIgWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // On page load action.
    SchedulerBinding.instance!.addPostFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      Theme.of(context).brightness == Brightness.dark
                          ? 'assets/images/WhatsApp_Image_2024-02-28_at_23.28.03.jpeg'
                          : 'assets/images/WhatsApp_Image_2024-02-28_at_23.28.01.jpeg',
                      width: 350,
                      height: 700,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 16,
                top: 16,
                child: IconButton(
                  onPressed: () {
                    // Add your back navigation logic here
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black, // Change to your desired color
                    size: 40,
                  ),
                ),
              ),
              Positioned(
                left: 16,
                top: 16,
                child: Container(
                  width: MediaQuery.of(context).size.width - 32,
                  height: MediaQuery.of(context).size.height - 32,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        child: Text('Button'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Addtostory1IgWidget()),
                          );
                        },
                        child: Text('Add to your Story for 24 hours'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          // Replace the navigation logic as per your app's requirements
                          // context.pushNamed('FOLLOW1_IG');
                        },
                        child: Text('Search and Follow your Friends'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          // Replace the navigation logic as per your app's requirements
                          // context.pushNamed('DM1_IG');
                        },
                        child: Text('Text your Friends (Direct Message)'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          // Replace the navigation logic as per your app's requirements
                          // context.pushNamed('POST1_IG');
                        },
                        child: Text('Post for your followers to see'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          // Replace the navigation logic as per your app's requirements
                          // context.pushNamed('REELS_IG');
                        },
                        child: Text('Scroll through reels for fun'),
                      ),
                    ],
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
