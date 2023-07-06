import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:strange/functions/parcel.dart';
import 'package:strange/firebase_crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List _allResults = [];
  List _resultList = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }

  _onSearchChanged() {
    print(_searchController.text);
    searchResultList();
  }

  searchResultList() {
  var showResults = [];
  if (_searchController.text != "") {
    for (var clientSnapshot in _allResults) {
      var name = clientSnapshot['trackingNumber'].toString().toLowerCase();
      if (name.contains(_searchController.text.toLowerCase())) {
        showResults.add(clientSnapshot);
      }
    }
  } else {
    showResults = List.from(_allResults);
  }

  // Exclude picked-up documents from the result list
  var pickedUpDocuments = showResults.where((snapshot) =>
      snapshot['Status'] != 'success' && snapshot['Status'] != 'picked-up');
  showResults = pickedUpDocuments.toList();

  setState(() {
    _resultList = showResults;
  });
}

  getClientStream() async {
    var data =
        await FirebaseFirestore.instance.collection('Parcel').orderBy('trackingNumber').get();
    setState(() {
      _allResults = data.docs;
    });
    searchResultList();
  }

  deleteDocument(String documentId) {
    FirebaseFirestore.instance.collection('Parcel').doc(documentId).delete();
  }

  pickUpDocument(String documentId) {
    FirebaseFirestore.instance
      .collection('Parcel')
      .doc(documentId)
      .update({'Status': 'success'})
      .then((_) {
    print('Pick-up successful');
  }).catchError((error) {
    print('Failed to pick up: $error');
  });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: CupertinoSearchTextField(
            controller: _searchController,
          ),
        ),
        body: ListView.builder(
          itemCount: _resultList.length,
          itemBuilder: (context, index) {
            var documentId = _resultList[index].id;
            return ListTile(
              title: Text(_resultList[index]['Location']),
              subtitle: Text(_resultList[index]['trackingNumber']),
              trailing: ElevatedButton(
                child: Text('Pick Up'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Pick Up Information'),
                        content: Text('Are you sure you want to pick up this information?'),
                        actions: [
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('Pick Up'),
                            onPressed: () {
                              pickUpDocument(documentId);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}