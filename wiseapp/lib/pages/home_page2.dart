import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wiseapp/pages/GoogleMaps/gm_main.dart';
import 'package:wiseapp/pages/Instagram/Insta_main.dart';
import 'package:wiseapp/pages/IRCTC/irctc_main.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/Whatsapp/Whatsapp_main.dart';
import 'package:wiseapp/pages/Zomato/zomato_main.dart';
import 'package:wiseapp/pages/Pinterest/pint_main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 
          AppLocalizations.of(context)!.wiseapp,
        ),
      ),
    );
  }
}

class HomeCopyWIdget2 extends StatefulWidget {
  const HomeCopyWIdget2({Key? key}) : super(key: key);
  
  @override
  State<HomeCopyWIdget2> createState() => _HomeCopyWidgetState();
}

class _HomeCopyWidgetState extends State<HomeCopyWIdget2> {
  late TextEditingController _textController;
  late FocusNode _textFieldFocusNode;
  bool _switchValue = true;
  List<String> appList = [
    "Instagram",
    "Zomato",
    "GPAY",
    "Google Maps",
    "IRCTC",
    // Add more app names as needed
  ];

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _textFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _textController.dispose();
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  List<String> performSearch(String query) {
    if (query.isEmpty) {
      return appList; // Return all apps if the query is empty
    }
    return appList
        .where((app) => app.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_textFieldFocusNode.canRequestFocus) {
          FocusScope.of(context).requestFocus(_textFieldFocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: _switchValue ? Colors.grey[200] : Colors.black,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                    child: Container(
                      child: ImageFetcher(
                        imageUrl: 'instagram_assets/WiseApp.png',
                        width: 230,
                        height: 45,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(90, 0, 20, 0),
                    child: Switch.adaptive(
                      value: _switchValue,
                      onChanged: (newValue) {
                        setState(() {
                          _switchValue = newValue;
                        });
                      },
                      activeColor: Colors.blue,
                      activeTrackColor: Colors.lightBlue,
                      inactiveTrackColor: Colors.grey,
                      inactiveThumbColor: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Search ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 158, 158, 158),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    // Search bar
                    TextField(
                      controller: _textController,
                      focusNode: _textFieldFocusNode,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 234, 232, 239),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Search Here",
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _textController.clear();
                            FocusScope.of(context).unfocus();
                          },
                          icon: Icon(Icons.clear),
                        ),
                      ),
                    ),
                    // Filtered app list
                    Expanded(
                      child: ListView.builder(
                        itemCount: performSearch(_textController.text).length,
                        itemBuilder: (context, index) {
                          final appName = performSearch(_textController.text)[index];
                          return ListTile(
                            contentPadding: const EdgeInsets.all(8.0),
                            title: Text(
                              appName,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: ImageFetcher(
                              imageUrl: 'instagram_assets/$appName.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.contain,
                            ),
                            onTap: () {
                              // Handle tap on the app
                              switch (appName) {
                                case 'Instagram':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => InstaMain()),
                                  );
                                  break;
                                case 'Zomato':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Zomato()),
                                  );
                                  break;
                                case 'GPAY':
                                  // Handle GPAY tap
                                  break;
                                case 'Google Maps':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => GoogleMaps()),
                                  );
                                  break;
                                case 'IRCTC':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => IRCTC()),
                                  );
                                  break;
                                default:
                                  break;
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: HomeCopyWIdget2(),
    ),
  ));
}
