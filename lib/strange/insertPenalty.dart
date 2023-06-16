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
    home: FormPage2(),
    
  ));
}

class FormPage2 extends StatefulWidget {
  const FormPage2({Key? key}) : super(key: key);

  @override
  _FormPageState2 createState() => _FormPageState2();
}

class _FormPageState2 extends State<FormPage2> {
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

Future<void> _addFine([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _trackController,
                  decoration: const InputDecoration(labelText: 'Tracking Number'),
                ),
                TextField(
                  controller: _fineController,
                  decoration: const InputDecoration(
                    labelText: 'Fine',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () async {
                    final String trackingNumber = _trackController.text;
                    final String Fine = _fineController.text;
                    if (trackingNumber != null) {
                        await _fineCollection
                        .add({"trackingNumber": trackingNumber, "Fine": Fine});

                      _trackController.text = '';
                      _fineController.text = '';
                        Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );

        });
  }

Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {

      _trackController.text = documentSnapshot['trackingNumber'];
      _fineController.text = documentSnapshot['Fine'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _trackController,
                  decoration: const InputDecoration(labelText: 'tracking number'),
                ),
                TextField(
                  controller: _fineController,
                  decoration: const InputDecoration(
                    labelText: 'Fine',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text( 'Update'),
                  onPressed: () async {
                    final String trackingNumber = _trackController.text;
                    final String Fine = _fineController.text;
        
                    if (trackingNumber!= null) {

                        await _fineCollection
                            .doc(documentSnapshot!.id)
                            .update({"trackingNumber": trackingNumber, "Fine": Fine});
                      _trackController.text = '';
                      _fineController.text = '';
                        Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

Future<void> _deleteFine(String fineId) async {
    await _fineCollection.doc(fineId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a parcel')));
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform form submission logic
      String trackingNumber = _trackController.text;
      String Fine = _fineController.text;

      // You can process the form data here, such as sending it to an API or saving to a database

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Form Submitted'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('tracking number: $trackingNumber'),
                const SizedBox(height: 10),
                Text('fine: $Fine'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }

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
                      child: Row(
                        children: [
// Press this button to edit a single product
                          IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () =>
                                  _update(documentSnapshot)),
// This icon button is used to delete a single product
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  _deleteFine(documentSnapshot.id)),
                        ],
                      ),
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

      floatingActionButton: FloatingActionButton(
        onPressed: () => _addFine(),
        child: const Icon(Icons.add),

      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}
