import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ornek/namelist.dart';
//import 'dart:html';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Iskele(),
    );
  }
}

class Iskele extends StatefulWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  State<Iskele> createState() => _IskeleState();
}

class _IskeleState extends State<Iskele> {
  var IncomeTextTitle = "";
  var IncomeTextContext = "";

  showtext() {
    Future<void> setAnswer() async {}

    setState(() {
      IncomeTextTitle =
          "*this is an emergency text. click next button for start";
      IncomeTextContext =
          "*context message codes are here: https://github.com/SabriAk/Exam_Expense_flutter_Firestore/tree/main";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.all(50),
          child: Center(
            child: Column(
              children: [
                Text(
                    'explain: THIS A TEST FOR ENTRANCE , PRESS BELOW BUTTON FOR SEEING TITTLE AND CONTENT '),
                ElevatedButton(onPressed: showtext, child: Text("TEST")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => namelist()));
                    },
                    child: Text("CHANGE THE PAGE, NEXT PAGE ==>")),
                ListTile(
                  title: Text(IncomeTextTitle),
                  subtitle: Text(IncomeTextContext),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
