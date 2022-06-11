import 'package:flutter/material.dart';
import 'package:paklan/Screens/Welcome/welcome_screen.dart';
import 'package:paklan/constants.dart';


import 'package:firebase_core/firebase_core.dart';


import 'package:paklan/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}