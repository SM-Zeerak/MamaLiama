import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mamasliama/screens/getStartedScreen/getStartedScreen.dart';
import 'package:mamasliama/utils/color_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: ClrUtls.primary,
      ),
      home: const Getstartedscreen(),
    );
  }
}
