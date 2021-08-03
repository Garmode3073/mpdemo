import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mpdemo/models/user.dart';
import 'package:mpdemo/services/dbservices.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //stream of user login
  Stream<UserInApp> get userIsIn {
    return _auth.userChanges().map(
          (event) => event == null
              ? null
              : UserInApp.fromMap(
                  {'uid': event.uid, 'email': event.email, 'password': ''},
                ),
        );
  }

  //get info of user with id
  Future<UserInApp> getUserWithId(String uid) async {
    UserInApp user = UserInApp.fromMap({uid: uid});
    DocumentSnapshot doc = await DatabaseServices(uid).currentUser();
    user.email = doc.get('email');
    user.password = doc.get('password');
    return user;
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      User user = result.user;
      return UserInApp.fromMap({
        'uid': user.uid,
        'email': email.trim(),
        'password': password.trim()
      });
    } catch (e) {
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      User user = result.user;
      DatabaseServices(user.uid).addUserInfo(UserInApp.fromMap({
        'uid': user.uid,
        'email': email.trim(),
        'password': password.trim()
      }));
      return UserInApp.fromMap({
        'uid': user.uid,
        'email': email.trim(),
        'password': password.trim()
      });
    } catch (e) {
      print(e);
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return 'error';
    }
  }
}
