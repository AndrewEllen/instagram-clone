import 'package:flutter/cupertino.dart';

class UserData with ChangeNotifier {

  String _userName = "User Name";
  String _userDisplayName = "User Display Name";
  String _pronouns = "Pronoun";
  String _bio = "Bio";

  String get userName => _userName;
  String get userDisplayName => _userDisplayName;
  String get pronouns => _pronouns;
  String get bio => _bio;

  void updateUserName(String newUserName) {
    _userName = newUserName;

    notifyListeners();
  }

  void updateUserDisplayName(String newUserDisplayName) {
    _userDisplayName = newUserDisplayName;

    notifyListeners();
  }

  void updatePronouns(String newPronouns) {
    _pronouns = newPronouns;

    notifyListeners();
  }

  void updateBio(String newBio) {
    _bio = newBio;
    
    notifyListeners();
  }
}
