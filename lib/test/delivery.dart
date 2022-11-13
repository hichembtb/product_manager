import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Delvry extends StatefulWidget {
  const Delvry({super.key});

  @override
  State<Delvry> createState() => _DelvryState();
}

class _DelvryState extends State<Delvry> {
  @override
  void initState() {
    del();
    super.initState();
  }

//! in this test we acces the map of product for the delivery
  CollectionReference deliveryRef =
      FirebaseFirestore.instance.collection('delivery');
  Future del() async {
    Future<QuerySnapshot<Object?>> delveryQuery = deliveryRef.get();
    delveryQuery.then((value) {
      List<QueryDocumentSnapshot<Object?>> delvDocs = value.docs;
      for (QueryDocumentSnapshot<Object?> delvDoc in delvDocs) {
        Map<String, dynamic> map = delvDoc.data() as Map<String, dynamic>;
        print(map['product'][0]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('data'),
    );
  }
}
