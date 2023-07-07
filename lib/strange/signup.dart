import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strange/Strange/login.dart';
import 'package:strange/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:strange/functions/auth.dart';

class SignUp1 extends StatefulWidget {
  // final Function? toggleView;
  //  SignUp1({this.toggleView});
//  final VoidCallback Login1Page;
 const SignUp1({Key? key, }) : super(key: key);

  @override
  State<SignUp1> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUp1>{

  List<String> role = ["Admin","Student"];

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPhoneNo = TextEditingController();
  final TextEditingController _controllerMatric = TextEditingController();
  final TextEditingController _controllerCollege = TextEditingController();
  final TextEditingController _controllerRole = TextEditingController();
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('Users');

@override
void dispose(){
  _controllerEmail.dispose();
  _controllerPassword.dispose();
  _controllerName.dispose();
  _controllerPhoneNo.dispose();
  _controllerMatric.dispose();
  _controllerCollege.dispose();
  _controllerRole.dispose();
  super.dispose();
}

Future signUp() async{
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _controllerEmail.text, 
    password: _controllerPassword.text,
    );

}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 600,
                      child: Image.asset(
                        'images/strange/3.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                   
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 300,
                            height: 60,
                            child: TextField(
                              autofocus: true,
                              controller: _controllerEmail,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 81, 13, 13),
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 81, 13, 13),
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Enter Your Email',
                                suffix: Icon(
                                  Icons.text_format,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                           Container(
                            width: 300,
                            height: 60,
                            child: TextField(
                              autofocus: true,
                              obscureText: true,
                              controller: _controllerPassword,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 81, 13, 13),
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 81, 13, 13),
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Enter Your Password',
                                suffix: Icon(
                                  Icons.lock,
                                  color: Color.fromARGB(255, 81, 13, 13),
                                ),
                              ),
                            ),
                          ),   SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 300,
                            height: 60,
                            child: TextField(
                              autofocus: true,
                              controller: _controllerName,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 81, 13, 13),
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 81, 13, 13),
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Enter Your Name',
                                suffix: Icon(
                                  Icons.people,
                                  color: Color.fromARGB(255, 81, 13, 13),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 300,
                            height: 60,
                            child: TextField(
                              autofocus: true,
                              obscureText: true,
                              controller: _controllerPhoneNo,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 81, 13, 13),
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 81, 13, 13),
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Phone Number',
                                suffix: Icon(
                                  Icons.call_end,
                                  color: Color.fromARGB(255, 81, 13, 13),
                                ),
                              ),
                            ),
                          ),
                             SizedBox(
                            height: 20,
                          ),
                                 Container(
                            width: 300,
                            height: 60,
                            child: TextField(
                              autofocus: true,
                              controller: _controllerMatric,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 81, 13, 13),
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 81, 13, 13),
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Matric Number',
                                suffix: Icon(
                                  Icons.assignment_ind_outlined,
                                  color: Color.fromARGB(255, 81, 13, 13),
                                ),
                              ),
                            ),
                          ),
                             SizedBox(
                            height: 20,
                          ),
                         
                         Container(
                           width: 300,
                            height: 60,
                          child: TextField(
                              autofocus: true,
                              controller: _controllerCollege,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 81, 13, 13),
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 81, 13, 13),
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'College',
                                suffix: Icon(
                                  Icons.assignment_ind_outlined,
                                  color: Color.fromARGB(255, 81, 13, 13),
                                ),
                              ),
                            ),
                          ),

                           SizedBox(
                            height: 20,
                          ),

                         Container(
                           width: 300,
                            height: 60,
                          child: TextField(
                              autofocus: true,
                              controller: _controllerRole,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 81, 13, 13),
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 81, 13, 13),
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Role',
                                suffix: Icon(
                                  Icons.assignment_ind_outlined,
                                  color: Color.fromARGB(255, 81, 13, 13),
                                ),
                              ),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: <Widget>[
                                Checkbox(
                                  value: false,
                                  onChanged: null,
                                ),
                                Text('I accept the policy and terms'),
                              ],
                            ),
                          ),
                          SizedBox(height: 30,),
                          ElevatedButton(
                            onPressed: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Login1Page()));
                              final String email = _controllerEmail.text;
                              final String password = _controllerPassword.text;
                              final String name = _controllerName.text;
                              final String Matric = _controllerMatric.text;
                              final String College = _controllerCollege.text;
                              final String Phone = _controllerPhoneNo.text;
                              final String role = _controllerRole.text;
                              if (email != null) {
                              await _usersCollection
                              .add({"email": email, "password": password, "name":name, "Matric": Matric, "College":College, "Phone":Phone, "role":role});

                      _controllerEmail.text = '';
                      _controllerPassword.text = '';
                      _controllerName.text='';
                      _controllerMatric.text='';
                      _controllerCollege.text='';
                        Navigator.of(context).pop();
                    }
                            },
                            child: Container(
                              width: 150,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color.fromARGB(255, 232, 97, 97),
                                      Color.fromARGB(255, 67, 11, 11)
                                    ]),
                              ),
                              child: Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
