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
    home: FormPage(),
    
  ));
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
 // final _formKey = GlobalKey<FormState>();
  final TextEditingController _locController = TextEditingController();
  final TextEditingController _trackController = TextEditingController();
  
final CollectionReference _parcelCollection =
      FirebaseFirestore.instance.collection('Parcel');


  @override
  void dispose() {
    _locController.dispose();
    _trackController.dispose();
    super.dispose();
  }
  
  Future<void> _addParcel([DocumentSnapshot? documentSnapshot]) async {
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
                  controller: _locController,
                  decoration: const InputDecoration(
                    labelText: 'Location',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () async {
                    final String trackingNumber = _trackController.text;
                    final String Location = _locController.text;
                    if (trackingNumber != null) {
                        await _parcelCollection
                        .add({"trackingNumber": trackingNumber, "Location": Location});

                      _trackController.text = '';
                      _locController.text = '';
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
      _locController.text = documentSnapshot['Location'];
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
                  controller: _locController,
                  decoration: const InputDecoration(
                    labelText: 'location',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text( 'Update'),
                  onPressed: () async {
                    final String trackingNumber = _trackController.text;
                    final String location = _locController.text;
        
                    if (trackingNumber!= null) {

                        await _parcelCollection
                            .doc(documentSnapshot!.id)
                            .update({"trackingNumber": trackingNumber, "Location": location});
                      _trackController.text = '';
                      _locController.text = '';
                        Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

Future<void> _deleteParcel(String parcelId) async {
    await _parcelCollection.doc(parcelId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a parcel')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert Parcel'),
      ),
      body: StreamBuilder(
        stream: _parcelCollection.snapshots(), //build connection
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
                    subtitle: Text(documentSnapshot['Location']),
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
                                  _deleteParcel(documentSnapshot.id)),
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
        onPressed: () => _addParcel(),
        child: const Icon(Icons.add),

      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}
