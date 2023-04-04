import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseconcept/screens/Home_page.dart';
import 'package:firebaseconcept/screens/fetch_data.dart';
import 'package:firebaseconcept/screens/insert_data.dart';
import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
      home: FetchData(),
      
      );
    
  }
}
