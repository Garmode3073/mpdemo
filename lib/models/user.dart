class UserInApp {
  String _uid;
  String _email;
  String _password;

  UserInApp(_uid, _email, _password);
  UserInApp.reg(_email, _password);

  String get uid => _uid;
  String get email => _email;
  String get password => _password;

  set uid(String ud) {
    this._uid = ud;
  }

  set email(String email) {
    this._email = email;
  }

  set password(String pass) {
    this._password = pass;
  }

  UserInApp.fromMap(Map map) {
    this._uid = map['uid'];
    this._email = map['email'];
    this._password = map['password'];
  }
}
