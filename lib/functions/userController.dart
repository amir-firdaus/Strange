// import 'package:strange/functions/locator.dart';
// import 'package:strange/functions/user.dart';
// import 'package:strange/functions/auth.dart';

// class UserController {
//   User _currentUser;
//   Auth _auth = locator.get<Auth>();
//   Future init;

//   UserController() {
//     init = initUser();
//   }

//   Future<User> initUser() async {
//     _currentUser = await _auth.getUser();
//     return _currentUser;
//   }

//   User get currentUser => _currentUser;
// }