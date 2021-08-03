import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mpdemo/models/user.dart';

class DatabaseServices {
  final String uid;

  DatabaseServices(this.uid);

  //current user
  Future<DocumentSnapshot> currentUser() async {
    return await FirebaseFirestore.instance.collection('users').doc(uid).get();
  }

  //add user
  Future addUserInfo(UserInApp user) async {
    var v = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set({'email': user.email, 'password': user.password});
  }
}
