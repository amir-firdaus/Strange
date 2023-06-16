import 'package:flutter/material.dart';
import 'package:strange/Strange/griddashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:strange/Strange/login.dart'; 
import 'package:strange/home.dart';
import 'package:strange/Strange/penalty.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:strange/firebase_options.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _Profil();
}

class _Profil extends State<Profile> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('Users');
  User? get currentUser => _firebaseAuth.currentUser;
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      String? userId = user?.uid;

      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('userId', isEqualTo: userId)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        setState(() {
          email = snapshot.docs.first.data()['email'];
        });
      }
    } catch (e) {
      print('Error fetching user profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF800000)
        )
        ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Profile"),          
        ),
        body: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("images/strange/trent.jpg"),
            ),

            
            ListTile(
              title: Center(child: Text("", style: TextStyle(fontSize: 30),),) ,
              subtitle: Center(child: Text("", style: TextStyle(fontSize: 15)),),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Homeful()));
              },
              child: Text("Go Back"),
              ),

              ElevatedButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => Login1Page()),);
              },
              child: Text("Log Out"),
              ),
              ],
            ),

              ListTile(
                title: Text("Email", style: TextStyle(fontSize: 20)),
                subtitle: Text(email, style: TextStyle(fontSize: 15)),
              ),

              ListTile(
                title: Text("Phone Number", style: TextStyle(fontSize: 20)),
                subtitle: Text("", style: TextStyle(fontSize: 15)),
              ),

              ListTile(
                title: Text("College", style: TextStyle(fontSize: 20)),
                subtitle: Text("", style: TextStyle(fontSize: 15)),
              ),

          ],
        )
        
        
         ),

    );
  }
}