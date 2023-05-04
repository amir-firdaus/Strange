import 'package:flutter/material.dart';


class SignUp1 extends StatelessWidget {


  final List<String> courses = ['Computer Science',    'Electrical Engineering',    'Mechanical Engineering',    'Civil Engineering',    'Business Administration',];
  final List<String> years = ['1st Year', '2nd Year', '3rd Year', '4th Year'];


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
                        'images/ux_ui_01/logo7.png',
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
                          child: 
                         
                           DropdownButtonFormField<String>(
                           
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
                              labelText: 'Course',
                              suffix: Icon(
                                Icons.school,
                                color: Color.fromARGB(255, 81, 13, 13),
                              ),
                            ),
                            value: null,
                            items: courses.map((course) {
                              return DropdownMenuItem<String>(
                                value: course,
                                child: Text(course),
                              );
                            }).toList(),
                            onChanged: (value) {},
                          ),
                         ),
                             SizedBox(
                            height: 20,
                          ),
                                  Container(
                           width: 300,
                            height: 60,
                          child: 
                         
                           DropdownButtonFormField<String>(
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
                                      labelText: 'Year',
                                      suffix: Icon(
                                        Icons.calendar_today,
                                        color: Color.fromARGB(255, 81, 13, 13),
                                      ),
                                    ),
                                    value: null,
                                    items: years.map((year) {
                                      return DropdownMenuItem<String>(
                                        value: year,
                                        child: Text(year),
                                      );
                                    }).toList(),
                                    onChanged: (value) {},
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
                          SizedBox(height: 20,),
                          TextButton(
                            onPressed: () {},
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


                          SizedBox(height: 20,),
                 
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
