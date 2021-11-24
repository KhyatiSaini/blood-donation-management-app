import 'package:flutter/foundation.dart';

import '../utilities/constants.dart';
import '../utilities/displayToast.dart';

class AdminProvider extends ChangeNotifier {
  bool isSignedIn = true;

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

  void adminSignOut() {
    isSignedIn = false;
    notifyListeners();
  }

  bool get adminAuthStatus => isSignedIn;

}