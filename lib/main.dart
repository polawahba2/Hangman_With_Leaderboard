import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:odc_hangman/Compounents/Const.dart';
import 'package:odc_hangman/GameLogicFuncions/GameLogicFunctions.dart';
import 'package:odc_hangman/Screens/GameScree.dart/GameScreen.dart';
import 'package:odc_hangman/Screens/WelcomeScreen/WelcomeScreen.dart';
import 'Screens/CreateUserScreen/CreateUserScreen.dart';
import 'Shared/CasheHelper.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CashHelper.init();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.blue[800],
    ),
  );
  id = CashHelper.getDate(key: 'id') ?? '';
  print(id);

  Widget whatIsTheHomeScreen() {
    if (id != '') {
      return WelcomeScreen();
    } else {
      return CreateUserScreen();
    }
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: GameScreen(),
      home: whatIsTheHomeScreen(),
    ),
  );
}
