import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Amirul", "age": 29235455, "Location": "Cengal Centre Point"},
    {"id": 2, "name": "Iman", "age": 443289121, "Location": "One Parcel Center"},
    {"id": 3, "name": "Amir", "age": 513514533, "Location": "Cengal Centre Point"},
    {"id": 4, "name": "Firdaus", "age": 3524111, "Location": "Cengal Centre Point"},
    {"id": 5, "name": "Faiz", "age": 2195745356, "Location": "One Parcel Center"},
    {"id": 6, "name": "Aiman", "age": 556523577, "Location": "One Parcel Center"},
    {"id": 7, "name": "Nazran", "age": 306467883, "Location": "One Parcel Center"},
    {"id": 8, "name": "Ahmad", "age": 145449622, "Location": "Cengal Centre Point"},
    {"id": 9, "name": "Hafizzul", "age": 1002476874, "Location": "Cengal Centre Point"},
    {"id": 10, "name": "Amiruddin", "age": 32114565768, "Location": "Cengal Centre Point"},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];

  @override
  void initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) => user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Parcel Tracking Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: const Text('Search for Parcel'),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: Colors.blue,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Text(
                            _foundUsers[index]["id"].toString(),
                            style: const TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          title: Text(_foundUsers[index]['Location'],
                              style: const TextStyle(color: Colors.white)),
                          subtitle: Text(
                            'Tracking Number: ${_foundUsers[index]["age"].toString()}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}