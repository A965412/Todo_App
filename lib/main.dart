import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/provider%20model.dart';

import 'Auth/Login/Log_In.dart';
import 'Auth/Register/Sign_up.dart';
import 'Home_page/Home_page.dart';
import 'mytheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBmN76l2eZyGmzPaw_FYJu-5TZcVdPU0WQ",
          appId: "1:1020338017564:android:86195ebac923af5e5e56d9",
          messagingSenderId: "1020338017564",
          projectId: "todoapp-8d910"));
  runApp(ChangeNotifierProvider(
      create: (context) => Appconfic(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfic>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LOGIN.RotuteName,
      routes: {
        LOGIN.RotuteName: (context) => LOGIN(),
        SignUp.RotuteName: (context) => SignUp(),
        HomePage.route_name: (context) => HomePage(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: Mytheme().lightmood,
      darkTheme: Mytheme().darktmood,
      themeMode: provider.appemode,
      locale: Locale(provider.LanguageApp),
    );
  }
}
