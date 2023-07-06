import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:strange/functions/parcel.dart';
import 'package:strange/firebase_crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Penalty2(),
    
  ));
}

class Penalty2 extends StatefulWidget {
  const Penalty2({Key? key}) : super(key: key);

  @override
  _Penalty2State createState() => _Penalty2State();
}

class _Penalty2State extends State<Penalty2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _trackController = TextEditingController();
  final TextEditingController _fineController = TextEditingController();

  final CollectionReference _fineCollection =
      FirebaseFirestore.instance.collection('Fines');

  @override
  void dispose() {
    _trackController.dispose();
    _fineController.dispose();
    super.dispose();
  }

      // You can process the form data here, such as sending it to an API or saving to a datab
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fine'),
      ),
      
      body: StreamBuilder(
        stream: _fineCollection.snapshots(), //build connection
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,  //number of rows
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(5),
                  child: ListTile(
                    title: Text(documentSnapshot['trackingNumber']),
                    subtitle: Text(documentSnapshot['Fine']),
                    trailing: SizedBox(
                      width: 100,
                      ),
                    ),
                  );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
