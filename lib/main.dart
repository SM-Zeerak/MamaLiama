import 'package:flutter/material.dart';
import 'package:mamasliama/screens/getStartedScreen/getStartedScreen.dart';
import 'package:mamasliama/utils/color_utils.dart';

void main() {
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
