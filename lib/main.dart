import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';





Future<void> main() async {
  runApp(ModularApp(module: AppModule(), child: AppWidget()));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

}