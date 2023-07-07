import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:strange/functions/parcel.dart';
import 'package:strange/firebase_crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: viewParcel(),
    
  ));
}

class viewParcel extends StatefulWidget {
  const viewParcel({Key? key}) : super(key: key);

  @override
  _ViewParcelState createState() => _ViewParcelState();
}

class _ViewParcelState extends State<viewParcel> {
final CollectionReference _parcelCollection =
      FirebaseFirestore.instance.collection('Parcel');
 String name = '';
 String email = '';

  final user = FirebaseAuth.instance.currentUser;
  final _userCollection = FirebaseFirestore.instance.collection('Users');

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      final userId = user!.uid;

      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _userCollection.doc(userId).get();

      if (snapshot.exists) {
        final data = snapshot.data();
      setState(() {
        name = data?['name'] ?? '';
        email = data?['email'] ?? '';
        });
      }
    } catch (e) {
      print('Error fetching user profile: $e');
    }
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parcel to be Picked Up!'),
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
                      child: Text(documentSnapshot['Penalty']),
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