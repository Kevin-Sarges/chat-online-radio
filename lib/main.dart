import 'package:desafio_radio/app/app_widget.dart';
import 'package:desafio_radio/app/data/inject/injectDependency.dart';
import 'package:desafio_radio/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  InjectDependency.init();

  runApp(const MyApp());
}
