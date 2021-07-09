import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/screens/home_page.dart';
import 'package:portfolio_app/screens/illustration_page.dart';
import 'package:portfolio_app/screens/photos_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const HomePage(),
        '/photos': (context) => const PhotosPage(),
        '/sketches': (context) => const SketchesPage(),
      },
    );
  }
}
