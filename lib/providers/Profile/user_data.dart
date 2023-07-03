import 'package:flutter/cupertino.dart';

class UserData with ChangeNotifier {

  String _userName = "User Name";
  String _userDisplayName = "User Display Name";

  String get userName => _userName;
  String get userDisplayName => _userDisplayName;

  void updateUserName(String newUserName) {
    _userName = newUserName;

    notifyListeners();
  }

  void updateUserDisplayName(String newUserDisplayName) {
    _userDisplayName = newUserDisplayName;

    notifyListeners();
  }

}