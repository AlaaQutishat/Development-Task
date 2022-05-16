import 'package:flutter/material.dart';

class DeviceProvider extends ChangeNotifier {
   String token ="";



  //update token after get from localstorage or after create in first time
  void updatetoken(String token) {
   this.token=token;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// get device token
  String gettoken() {
    return token;
  }
}