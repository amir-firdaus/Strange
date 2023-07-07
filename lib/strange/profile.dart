import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:strange/Strange/login.dart';
import 'package:strange/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String email = '';
  String password = '';
  String college = '';
  String Matric = '';
  String name = '';
  String Phone ='';
  String role = '';

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
        email = data?['email'] ?? '';
        college = data?['College'] ?? '';
        name = data?['name'] ?? '';
        Matric = data?['Matric'] ?? '';
        Phone = data?['Phone'] ?? '';
        role = data?['role'] ?? '';
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
    home:Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Column(
        children: [
          ListTile(
              title: Center(child: Text(name, style: TextStyle(fontSize: 30),),) ,
              subtitle: Center(child: Text(Matric, style: TextStyle(fontSize: 15)),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
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
                title: Text("email", style: TextStyle(fontSize: 20)),
                subtitle: Text(email, style: TextStyle(fontSize: 15)),
              ),

              ListTile(
                title: Text("Phone Number", style: TextStyle(fontSize: 20)),
                subtitle: Text(Phone, style: TextStyle(fontSize: 15)),
              ),

              ListTile(
                title: Text("College", style: TextStyle(fontSize: 20)),
                subtitle: Text(college, style: TextStyle(fontSize: 15)),
              ),

              ListTile(
                title: Text("Role", style: TextStyle(fontSize: 20)),
                subtitle: Text(role, style: TextStyle(fontSize: 15)),
              ),
        ]
              ),
            ),
          ); 
  }
}