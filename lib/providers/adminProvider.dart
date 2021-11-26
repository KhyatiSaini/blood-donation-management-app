import 'package:flutter/foundation.dart';

import '../utilities/constants.dart';
import '../utilities/displayToast.dart';

class AdminProvider extends ChangeNotifier {
  bool isSignedIn = false;

  /// function for admin login, setting [isSignedIn] true if sign-in is successful otherwise false
  bool adminSignIn(String admin, String password) {
    if (admin == adminName && password == adminPassword) {
      displayToast("Admin signed in successfully");
      isSignedIn = true;
    }
    else if (admin == adminName) {
      displayToast("Sign in unsuccessful - Wrong password");
      isSignedIn = false;
    }
    else if (password == adminPassword) {
      displayToast("Sign in unsuccessful - Wrong admin name");
      isSignedIn = false;
    }
    else {
      displayToast("Sign in unsuccessful - Wrong credentials");
      isSignedIn = false;
    }
    notifyListeners();
    return isSignedIn;
  }

  /// function to sign out the admin
  void adminSignOut() {
    isSignedIn = false;
    displayToast("Admin logged out successfully");
    notifyListeners();
  }

  /// function to return [isSignedIn] to determine if the admin is signed in
  bool get adminAuthStatus => isSignedIn;

}