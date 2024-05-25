import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'Splashscreen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ymca all in one',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.black45,
        scaffoldBackgroundColor: Colors.grey.shade50,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
        ),
        // textTheme: const TextTheme(
        //   headline6: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.indigo),
        //   subtitle1: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
        // ),
        iconTheme: const IconThemeData(color: Colors.indigo, size: 60),
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<String> items = [
    "Data structure",
    "Operating system",
    "Computer networks",
    "Dbms",
    "OOPS",
    "Machine learning",
    "Artificial intelligence"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ymca faridabad"),
      ),
    );
  }
}
