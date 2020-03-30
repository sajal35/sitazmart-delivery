import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Firestore firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Description'),
      ),
      body: StreamBuilder(
        stream: firestore.collection('purchase').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.documents.length == null ? 0 : snapshot.data.documents.length ,
              itemBuilder: (context,index){
                var mydata = snapshot.data.documents[index];
                return ListTile(
                  title: Text(mydata['orderno'].toString()),
                  subtitle: Text(mydata['name']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
