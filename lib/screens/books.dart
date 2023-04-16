import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Books')),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('Books').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          List<Widget> booksWidgets =
              snapshot.data!.docs.map((DocumentSnapshot doc) {
            String title = doc['Book'];
            return Container(
              padding: EdgeInsets.all(8.0),
              child: Text(title),
            );
          }).toList();

          return ListView(children: booksWidgets);
        },
      ),
    );
  }
}
