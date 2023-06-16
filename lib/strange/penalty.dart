import 'package:flutter/material.dart';

class PenaltyDetails {
  final String penaltyID;
  final String penaltyAmount;

  PenaltyDetails({required this.penaltyID, required this.penaltyAmount});
}


void main() {
  runApp(Penalty());
}

class Penalty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Penalty Fines'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/download.jpeg'),
              ),
              SizedBox(height: 20),
              Text(
                'Penalty & Fine',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'RM2.00',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Alert : The Fines will be increase RM1.00 each week',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
 
                ],
              ),
              SizedBox(height: 20),
               Text('Payment History',style:TextStyle(fontSize:15,fontWeight:FontWeight.bold),),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(10),
                  children: [
                    ListTile(
                      leading: Icon(Icons.payment),
                      title: Text('RM1.00'),
                      subtitle: Text('Tracking Number: 3245989115'),
                      
                    ),
                    ListTile(
                      leading: Icon(Icons.payment),
                      title: Text('RM1.00'),
                      subtitle: Text('Tracking Number: 32284822'),
                    ),
                    ListTile(
                      leading: Icon(Icons.payment),
                      title: Text('Rm1.00'),
                      subtitle: Text('Tracking Number: 32441981894'),
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