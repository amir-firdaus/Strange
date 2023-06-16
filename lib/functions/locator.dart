import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServices(){
  locator.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
}