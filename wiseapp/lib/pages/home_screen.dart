import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wiseapp/controller/language_change_controller.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';



enum Language { english, hindi, gujarati } // Define the Language enum here

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    speakWelcomeText(); // Call the method to speak the welcome text
  }

  Future<void> speakWelcomeText() async {
    await flutterTts.setLanguage('en');
    await flutterTts.setPitch(1.0);
    await flutterTts.speak('Welcome To WiseApp');
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.wiseapp),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () => _showLanguageSelectionDialog(context),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background.jpg',
             // Replace with your image asset
            fit: BoxFit.cover,
          ),
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                AppLocalizations.of(context)!.welcomewiseapp, // Add this text widget
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20), // Add some space between the text and the button
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeCopyWidget()), // Navigate to HomePage
                );
              },
              child: Text(
              AppLocalizations.of(context)!.letsgo,
            ),
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }

  void _showLanguageSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Language'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                _buildLanguageOption(context, 'English', Language.english),
                _buildLanguageOption(context, 'Hindi', Language.hindi),
                _buildLanguageOption(context, 'Gujarati', Language.gujarati),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(
      BuildContext context, String language, Language value) {
    return InkWell(
      onTap: () {
  Locale selectedLocale;
  switch (value) {
    case Language.english:
      selectedLocale = Locale('en');
      break;
    case Language.hindi:
      selectedLocale = Locale('hi');
      break;
    case Language.gujarati:
      selectedLocale = Locale('gu');
      break;
  }
  Provider.of<LanguageChangeController>(context, listen: false)
      .changeLanguage(selectedLocale);
  Navigator.pop(context); // Close the dialog
},

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(language),
      ),
    );
  }
}
