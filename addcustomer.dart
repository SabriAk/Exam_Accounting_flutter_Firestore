import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ornek/addcustomer.dart';
import 'package:ornek/finance.dart';
import 'package:ornek/namelist.dart';

//import 'dart:html';
//cari eklemek için, bu sayfa hazırlanmıştır.

class addcustomer extends StatefulWidget {
  //DocumentSnapshot docid;
  // cariekle({required this.docid});

  @override
  State<addcustomer> createState() => _addcustomerState();
}

class _addcustomerState extends State<addcustomer> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController t4 = TextEditingController(); //carigrup
  TextEditingController t5 = TextEditingController(); //caariad
  TextEditingController t6 = TextEditingController(); //bakiye
  TextEditingController t7 = TextEditingController(); //parabirimi

  ////veri ekleme
  addCari() {
    Map<String, dynamic> data = {
      'GroupName': t4.text,
      "CustomerName": t5.text,
      "Amount": t6.text,
      "Currency": t7.text,
    };

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('customer');
    collectionReference.add(
        data); //.then((value) => dataAddSuccess(context)).catchError((error)=>dataAddError(context));
  }

  @override
  void initState() {
    // Title = TextEditingController(text: widget.docid.get('Title'));
    // content = TextEditingController(text: widget.docid.get('content'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            color: Colors.yellow,
            onPressed: () {},
            child: Text("Add Customer MENU"),
          ),
          MaterialButton(
            color: Colors.red,
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
                  hintText: 'Title',
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
                    hintText: 'content',
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
                    //ALACAK
                    textAlign: TextAlign.center,
                    controller: t4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'add group',
                    ),
                  ),
                  TextField(
                    //BORÇ
                    textAlign: TextAlign.center,
                    controller: t5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'input customer name',
                    ),
                  ),
                  TextField(
                    //gruplandırma
                    textAlign: TextAlign.center,
                    controller: t6,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Balance',
                    ),
                  ),
                  TextField(
                    //AÇIKLAMA
                    textAlign: TextAlign.center,
                    controller: t7,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Currency Unit',
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
                              child: Text("<==List")),
                          ElevatedButton(
                              onPressed: addCari, child: Text("ADD_NAME")),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => finance()));
                              },
                              child: Text("FINANCE")),
                          ElevatedButton(
                              onPressed: () {}, child: Text("FIND_NAME")),
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
