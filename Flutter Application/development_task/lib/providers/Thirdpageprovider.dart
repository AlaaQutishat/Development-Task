import 'package:flutter/material.dart';

import '../Constants/app_constants.dart';
import '../models/FormsModel.dart';
import 'package:http/http.dart' as http;
class ThirdpageProvider extends ChangeNotifier {
  List<FormData> previousforms = [];
  bool isloading=false;


  void clear(){
   isloading=false;
    previousforms.clear();
    notifyListeners();
  }
void updateloading(isloading){
  this.isloading=isloading;
  notifyListeners();
}
  void updatepreviousforms( List<FormData>  previousforms){
    this.previousforms=previousforms;
    notifyListeners();
  }
}