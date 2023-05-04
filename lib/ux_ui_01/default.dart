import 'package:flutter/material.dart';
class Default1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image(image: AssetImage('images/ux_ui_01/dolphin.png'),width: 200,height: 200,),
                Text('Sign Up',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                Text('It\'s easier to sign up now',style: TextStyle(fontSize: 18,),),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff5165ea),
                    ),
                    child: ListTile(
                      leading: Image.asset('images/ux_ui_01/facebook.png'),
                      title: Text(
                        'Continue with Facebook',
                        style: TextStyle(color: Colors.white,fontSize: 20),
                      ),
                    ),
                  ),
                ),
               Container(
                child: ElevatedButton(
                         child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                  ),
                  primary: Color(0xff23818a),
                ),
                onPressed: () {},
                child: Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
                ),
               ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('images/ux_ui_01/icons8_Twitter_Circled_48px.png'),
                      width: 35,
                      height: 35,
                    ),
                    Image(
                      image: AssetImage('images/ux_ui_01/google.png'),
                      width: 35,
                      height: 35,
                    ),
                    Image(
                      image: AssetImage('images/ux_ui_01/icons8_LinkedIn_Circled_48px.png'),
                      width: 35,
                      height: 35,
                    ),
                  ],
                ),
                TextButton(
                  onPressed: (){},
                  child: Text(
                    'Already have an account! Login',
                    style: TextStyle(color: Colors.grey[500],fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
