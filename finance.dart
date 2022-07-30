import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ornek/addcustomer.dart';
import 'package:ornek/finance.dart';
import 'package:ornek/financelist.dart';
import 'package:ornek/namelist.dart';
//import 'dart:html';

//cari hareket eklemek için, bu sayfa hazırlanmıştır.

class finance extends StatefulWidget {
  //DocumentSnapshot docid;
  //finans({required this.docid});

  @override
  State<finance> createState() => _financeState();
}

class _financeState extends State<finance> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController t3 = TextEditingController(); //GroupName
  TextEditingController t4 = TextEditingController(); //income
  TextEditingController t5 = TextEditingController(); //expense
  TextEditingController t6 = TextEditingController(); //explain
  TextEditingController t7 = TextEditingController(); //code

  ////veri ekleme
  addHareket() {
    Map<String, dynamic> data = {
      'GroupName': t3.text,
      'income': t4.text,
      "expence": t5.text,
      "explain": t6.text,
      "code": t7.text,
      'time': DateTime.now(),
    };

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('movement');
    collectionReference.add(
        data); //.then((value) => dataAddSuccess(context)).catchError((error)=>dataAddError(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            color: Colors.yellow,
            onPressed: () {},
            child: Text("Add Finance MENU"),
          ),
          MaterialButton(
            color: Colors.green,
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => namelist()));
            },
            child: Text("Back to the List"),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                  hintText: 'GroupTitle',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: content,
                  //expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Content',
                  ),
                ),
              ),
            ),
            //container lar üst üste gelmiştir. ölçü ver alt alta al,  bunu çöz
            //expands : true devre dışı bırakılınca düzeldi.
            Container(
              //color: Colors.red.shade400,
              child: Column(
                children: [
                  TextField(
                    //group name
                    textAlign: TextAlign.center,
                    controller: t3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'GroupName',
                    ),
                  ),
                  TextField(
                    //ALACAK
                    textAlign: TextAlign.center,
                    controller: t4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'input income',
                    ),
                  ),
                  TextField(
                    //BORÇ
                    textAlign: TextAlign.center,
                    controller: t5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'input expense',
                    ),
                  ),
                  TextField(
                    //gruplandırma
                    textAlign: TextAlign.center,
                    controller: t6,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'explain',
                    ),
                  ),
                  TextField(
                    //AÇIKLAMA
                    textAlign: TextAlign.center,
                    controller: t7,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'project code:(exam:p1)',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => namelist()));
                              },
                              child: Text("<<==BackList")),
                          ElevatedButton(
                              onPressed: addHareket,
                              child: Text("Add_Finance")),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => financelist()));
                              },
                              child: Text("FinanceList")),
                          ElevatedButton(
                              onPressed: () {}, child: Text("Empty2")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
