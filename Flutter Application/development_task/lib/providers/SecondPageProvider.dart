import 'package:flutter/material.dart';

class SecondpageProvider extends ChangeNotifier {
   List<TextEditingController> controllers = [];




  void generatecontrollers(filednumber) {
    controllers=[];
    for(int i=0;i<filednumber;i++) {
      controllers.add(TextEditingController());
    }
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }


  String getcontrollersvalues() {
    String values="";
    for(int i=0;i<controllers.length;i++){
      if(i==(controllers.length-1)) {
        values+=controllers[i].text;
      } else {
        values+=controllers[i].text +",";
      }
    }
    return values;
  }
}