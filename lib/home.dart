import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:strange/Strange/login.dart';
import 'package:strange/Strange/signup.dart';
import 'package:strange/Strange/profile.dart';
import 'package:strange/Strange/status.dart';
import 'package:strange/strange/PenaltyParcel.dart';
import 'package:strange/strange/listViewParcel.dart';
import 'package:strange/strange/insertPenalty.dart';
import 'package:strange/strange/InsertParcel.dart';


void main() => runApp(MaterialApp(home: Log(),));

class Log extends StatefulWidget {
  @override
  _LogState createState() => _LogState();
  
}

class _LogState extends State<Log> {
  bool _showLogin = true;
  @override
Widget build(BuildContext context) {
  if (_showLogin) {
     return Login1Page();
   } else {
    return SignUp1();
  }
}
   void toggleView() {
    setState(() {
      _showLogin = !_showLogin;
    });
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
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
        role = data?['role'] ?? '';
        });
      }
    } catch (e) {
      print('Error fetching user profile: $e');
    }
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243,1),
      appBar:AppBar(
        backgroundColor:Colors.white,
        elevation:3,
        leading:ElevatedButton(
              onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile()));
                },
       child:Container(
           decoration:BoxDecoration( 
            borderRadius: BorderRadius.circular(40) ,
             color:Colors.black, 
              image:DecorationImage(
           image:AssetImage('images/strange/avatar.png'),
          ),
             
              
          ) ,
          
          
            
         
          ),
      ),
      ),
      body:SafeArea(
        child: SingleChildScrollView(
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children:<Widget>[
            Container(
              width:double.infinity,
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius:BorderRadius.vertical(bottom:Radius.circular(30))
               
              ),
              padding:EdgeInsets.all(20.0),
              child:Column(
                children:<Widget> [
                  Text('UTM Parcel',style:TextStyle(color:Colors.black87,fontSize:25),),
                  SizedBox(
                    height:5,
                  ),
                  Text('Centre Point',style: TextStyle(color:Colors.black,fontSize:40),),
                  Container(
                    padding:EdgeInsets.all(5),
                    decoration:BoxDecoration(
                    color:Color.fromRGBO(244, 243, 243, 1) ,
                    borderRadius: BorderRadius.circular(15)         
                    ),
                    child:TextField( 
                      decoration:InputDecoration(
                        border:InputBorder.none,
                        prefixIcon:Icon(Icons.search,color:Colors.black87,),
                        hintText:"Search you are looking",
                        hintStyle:TextStyle(color:Colors.grey,fontSize:15)

                      ),
                    ),
                  ),
                  SizedBox(
                    height:10
                  ),
                ],)
            ),
             SizedBox(
                    height:20
                  ),
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal:20.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget>[
                           Text('Features',style:TextStyle(fontSize:15,fontWeight:FontWeight.bold),),
                           SizedBox(height:15,),
                           SizedBox(
                            height:20,
                            
                           ),
                           
                           Visibility(
                               visible: role == 'Admin',
                               child:
                            Align(alignment: Alignment.center,

                          child: ElevatedButton(
                            onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> AddParcel()));
                          },

                           child:Container(
                            height:150,
                            width:265,
                            decoration:BoxDecoration(
                              borderRadius:BorderRadius.circular(20),
                              image:DecorationImage( 
                               fit:BoxFit.contain,
                                image:AssetImage('assets/parcel.png')
                              ),
                              
                              color:Colors.white
                              
                            ),
                            child:const Align(
                              alignment: Alignment.bottomCenter,
                              child:Padding(
                                padding:const EdgeInsets.all(15.0),
                                child:Text('Add Parcel',style:TextStyle(color:Colors.black,fontSize:20),),
                              )
                            )
                           ),
                            ),
                            ),
                           ),

                            

                            SizedBox(height: 20,),
                            Align(alignment: Alignment.center,

                          child: ElevatedButton(
                            onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> viewParcel()));
                          },

                           child:Container(
                            height:150,
                            width:265,
                            decoration:BoxDecoration(
                              borderRadius:BorderRadius.circular(20),
                              image:DecorationImage( 
                               fit:BoxFit.contain,
                                image:AssetImage('assets/parcel.png')
                              ),
                              
                              color:Colors.white
                              
                            ),
                            child:const Align(
                              alignment: Alignment.bottomCenter,
                              child:Padding(
                                padding:const EdgeInsets.all(15.0),
                                child:Text('View Parcel',style:TextStyle(color:Colors.black,fontSize:20),),
                              )
                            )
                           ),
                            ),
                            ),

                            SizedBox(
                            height:20,
                           ),
                           Visibility(
                               visible: role == 'Admin',
                               child:
                           Align(alignment: Alignment.center,

                           child: ElevatedButton(
                            onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> AddPenalty()));
                          },

                            child:Container(
                            height:150,
                            width:265,
                            decoration:BoxDecoration(
                              borderRadius:BorderRadius.circular(20),
                              image:DecorationImage( 
                               fit:BoxFit.contain,
                               image:AssetImage('assets/money.png')
                               ),
                              color:Colors.white
                               
                            ),
                            child:const Align(
                              alignment: Alignment.bottomCenter,
                              child:Padding(
                                padding:const EdgeInsets.all(15.0),
                                child:Text('Add Penalty Fines',style:TextStyle(color:Colors.black,fontSize:20),),
                              )
                            )
                           )
                           )
                           )
                           ),


                          
                            SizedBox(
                            height:20,
                           ),
                           Align(alignment: Alignment.center,

                           child: ElevatedButton(
                            onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> viewPenalty()));
                          },

                            child:Container(
                            height:150,
                            width:265,
                            decoration:BoxDecoration(
                              borderRadius:BorderRadius.circular(20),
                              image:DecorationImage( 
                               fit:BoxFit.contain,
                               image:AssetImage('assets/money.png')
                               ),
                              color:Colors.white
                               
                            ),
                            child:const Align(
                              alignment: Alignment.bottomCenter,
                              child:Padding(
                                padding:const EdgeInsets.all(15.0),
                                child:Text('View Penalty Fines',style:TextStyle(color:Colors.black,fontSize:20),),
                              )
                            )
                           )
                           )
                           )
                          

                      ],
                    ),
                      
                  )
          ],
        ),
      ),
      )
    );
  }
}


