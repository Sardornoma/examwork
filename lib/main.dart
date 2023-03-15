import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:exes/screens/language_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Payme());
}

class Payme extends StatelessWidget {
  const Payme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      home: const LanguageScreen(),
    );
  }
}
