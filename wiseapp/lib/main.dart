import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:wiseapp/controller/language_change_controller.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wiseapp/pages/home_screen.dart';
import 'package:wiseapp/pages/text_to_speech.dart';
import 'package:wiseapp/pages/video_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDR5NfDnDPBggkwTnQEqiaoQu65tyBNJ9o",
      projectId: "wiseapp-22256",
      storageBucket: "wiseapp-22256.appspot.com",
      messagingSenderId: "798895064061",
      appId: "1:798895064061:android:294c7c61af35d3ee898f94",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageChangeController()),
      ],
      child: Consumer<LanguageChangeController>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'Languages',
            locale: provider.applocale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en'),
              const Locale('hi'),
              const Locale('gu'),
            ],
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
            ),
            home: MyHomePage(title: 'WiseApp'),
          );
        },
      ),
    );
  }
}
