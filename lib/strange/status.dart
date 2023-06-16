import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:strange/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

// void main() {
//   runApp(MyApp());
// }

class Parcel {
  final String trackingNumber;
  final String status;

  Parcel({required this.trackingNumber, required this.status});
}

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);
  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Check Arrival Parcel',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          0xFF800000,
          <int, Color>{
            50: Color(0xFFE6B3B3),
            100: Color(0xFFCC6666),
            200: Color(0xFFB34D4D),
            300: Color(0xFF993333),
            400: Color(0xFF802626),
            500: Color(0xFF661919),
            600: Color(0xFF4D0F0F),
            700: Color(0xFF330A0A),
            800: Color(0xFF1A0505),
            900: Color(0xFF000000),
          },
        ),
      ),
      home: ParcelStatusPage(),
    );
  }
}

class ParcelStatusPage extends StatelessWidget {
  final Parcel parcel = Parcel(
    trackingNumber: '',
    status: '',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Arrival Parcel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tracking Number:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              parcel.trackingNumber,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Status:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              parcel.status,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}