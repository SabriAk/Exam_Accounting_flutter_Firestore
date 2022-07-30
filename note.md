import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ornek/pardus.dart';
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
  var GelenyaziBasligi = "";
  var GelenyaziIcerigi = "";

  yaziekle() {
    FirebaseFirestore.instance
        .collection('question')
        .doc('Widget.question.id')
        .update({
      'ans': FieldValue.arrayUnion([
        {'content': "freak", 'timestamp': DateTime.now(), 'username': "abishka"}
      ])
    }).whenComplete(() => print("yazı eklendi"));
  }

  yazigetir() {
    FirebaseFirestore.instance
        .collection("tv")
        .doc('samsung2')
        .get()
        .then((Gelenveri) {
      setState(() {
        GelenyaziBasligi = Gelenveri.data()!['ad'];
        GelenyaziIcerigi = Gelenveri.data()!['soyad'];
      });
    });
  }

  arraygetir() {
    setState(() {
      GelenyaziBasligi = "array için denemedir";
      GelenyaziIcerigi = "liste çağrılması içn hazırlık testidir";
    });
  }

  yazigoster() {
    Future<void> setAnswer() async {
      var ans_Controller;
      String ans = ans_Controller.text;
      FirebaseFirestore db = FirebaseFirestore.instance;

      await db.runTransaction((transaction) async {
        DocumentReference qRef =
            db.collection('question').doc('Widget.question.id');
        await qRef.update({
          'ans': FieldValue.arrayUnion([
            {
              'content': ans,
              'timestamp': DateTime.now().toString(),
              'username': '_currentUser.displayName',
            }
          ])
        });
      });
    }

    setState(() {
      GelenyaziBasligi = "*başlık uyarı mesajıdır.";
      GelenyaziIcerigi = "*içerik mesajı örneğidir.";
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
                Text('BİLGİ YOLLAMAK İÇİN BUTONA BASINIZ'),
                ElevatedButton(onPressed: yaziekle, child: Text("EKLE")),
                Text('BİLGİ GETİRMEK İÇİN BUTONA BASINIZ'),
                ElevatedButton(onPressed: yazigetir, child: Text("GETİR")),
                Text('ARRAY GETİRMEK İÇİN BUTONA BASINIZ'),
                ElevatedButton(
                    onPressed: arraygetir, child: Text("ARRAY_LİSTE")),
                Text('ARRAY2 GETİRMEK İÇİN BUTONA BASINIZ'),
                ElevatedButton(
                    onPressed: yazigoster, child: Text("ARRAY2_YAZI_GOSTER")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => pardus()));
                    },
                    child: Text("SAYFA DEĞİŞ")),
                ListTile(
                  title: Text(GelenyaziBasligi),
                  subtitle: Text(GelenyaziIcerigi),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
