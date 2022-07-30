import 'package:ornek/finans.dart';

import 'cariekle.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//to  do list datatable

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class pardus extends StatefulWidget {
  @override
  _pardusState createState() => _pardusState();
}

class _pardusState extends State<pardus> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('customer').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Iskele()));
            },
            child: Text("Back"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => cariekle()));
            },
            child: Text("AddCustomer"),
          ),
        ],
      ),
//BODY KISMI
      body: Container(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('customer')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                        // margin: EdgeInsets.only(left: displayWidth(context)*0.5,top: displayHeight(context)*0.5),
                        child: CircularProgressIndicator());
                  }
                  return new DataTable(
                    columns: <DataColumn>[
                      new DataColumn(
                        label: Text('GroupName'),
                      ),
                      new DataColumn(
                        label: Text('CustomerName'),
                      ),
                      new DataColumn(
                        label: Text('Balance'),
                      ),
                      new DataColumn(
                        label: Text('Current_Unit'),
                      ),
                      new DataColumn(
                        label: Text('EditName'),
                      ),
                      new DataColumn(
                        label: Text('AddMoney'),
                      ),
                      new DataColumn(
                        label: Text('Delete'),
                      ),
                    ],
                    rows: _createRows(snapshot.data!, context),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//////_createRows FONKSİYONU/////////////////
List<DataRow> _createRows(QuerySnapshot snapshot, context) {
  List<DataRow> newList =
      snapshot.docs.map((DocumentSnapshot documentSnapshot) {
    return new DataRow(cells: [
      DataCell(Text(documentSnapshot['GroupName'].toString())),
      DataCell(Text(documentSnapshot['CustomerName'].toString())),
      DataCell(Text(documentSnapshot['Amount'].toString())),
      DataCell(Text(documentSnapshot['Currency'].toString())),
      DataCell(IconButton(
        onPressed: () {
          print("edit button succed");
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => cariekle()));
        },
        icon: Icon(
          Icons.edit,
          color: Colors.blue,
        ),
      )),
      DataCell(IconButton(
        onPressed: () {
          print("add_money button is ok");
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => finans()));
        },
        icon: Icon(
          Icons.account_tree_sharp,
          color: Color.fromARGB(255, 35, 240, 8),
        ),
      )),
      // ignore: prefer_const_constructors
      DataCell(
        IconButton(
          onPressed: () {
            print("delete button is working");
          },
          iconSize: 20,
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    ]);
  }).toList();

  return newList;
}
