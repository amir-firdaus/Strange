import 'package:flutter/material.dart';
import 'package:strange/home.dart';
import 'package:strange/main.dart';
import 'package:strange/strange/signup.dart';
import '../functions/auth.dart';

class Login1Page extends StatefulWidget{
  const Login1Page({Key? key}) : super(key: key);
  @override
  State<Login1Page> createState() => _Login1PageState();
}

class _Login1PageState extends State<Login1Page> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final auth = Auth();
  bool isLogin = true;
  
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
                        'images/strange/2.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 50,
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
                                  Icons.alternate_email,
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
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: <Widget>[
                                Checkbox(
                                  value: false,
                                  onChanged: null,
                                ),
                                Text('Remember Me'),
                                SizedBox(width: 50,),
                               // Text('Forgot Password?'),
                               // SizedBox(width: 50,),
                                TextButton(
                                 onPressed: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp1()));
                             },
                              child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.black),
                                ), 
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextButton(
                            onPressed: () async {
                              try {
                                await auth.signInWithEmailAndPassword(
                                  email: _controllerEmail.text, // Replace with your email text field controller
                                  password: _controllerPassword.text, // Replace with your password text field controller
                                );
                                // Sign in successful, navigate to home page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Homeful()),
                                );
                              } catch (e) {
                                // Sign in failed, display an error message
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Login Error'),
                                      content: Text(e.toString()),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
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
                                  'Log In',
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
