import 'package:flutter/material.dart';

class FirstPageProvider extends ChangeNotifier {
  String type ="";


  void clear( ) {
    this.type="";
    notifyListeners();
  }


  void updatetype(String type) {
    this.type=type;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }


  String gettype() {
    return type;
  }
}