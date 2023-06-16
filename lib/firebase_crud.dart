import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:strange/functions/parcel.dart';
import 'package:strange/functions/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _usersCollection = _firestore.collection('Users');
final CollectionReference _packageCollection = _firestore.collection('Package');
final CollectionReference _parcelCollection = _firestore.collection('Parcel');
final CollectionReference _fineCollection = _firestore.collection('Fines');

class FirebaseCRUD {
//Crud Method here
static Future<Response> addParcel({
    required String Location,
    required String trackingNumber
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
        _parcelCollection.doc();

    Map<String, String> data = <String, String>{
      "Location": Location,
      "tracking_number": trackingNumber
    };

    var result = await documentReferencer
        .set(data)
        .whenComplete(() {
          response.code = 200;
          response.message = "Sucessfully added to the database";
        })
        .catchError((e) {
            response.code = 500;
            response.message = e;
        });
        return response;
  }

  static Stream<QuerySnapshot> readParcel() {
    CollectionReference notesItemCollection =
        _parcelCollection;

    return notesItemCollection.snapshots();
  }

}