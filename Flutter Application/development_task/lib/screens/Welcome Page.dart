import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../Utils/services/Api_Assistant_Methods.dart';
import '../models/ApiResponse.dart';
import 'package:provider/provider.dart';
import '../Constants/app_constants.dart';
import '../providers/Device_Provider.dart';
import '../widgets/CustomButton.dart';
import 'First page.dart';
import 'ThirdPage.dart';
late SharedPreferences _preferences;

class WelcomePage extends StatefulWidget {
  static  init() async {
    _preferences = await SharedPreferences.getInstance();
  }
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  check_device_token_register() async {
    //check if first time or not if first time the key not register yet else get value
    if(_preferences.getString("device_token")==null||_preferences.getString("device_token")==""){
      var uuid = const Uuid();
      _preferences.setString("device_token", uuid.v1().toString());
      Provider.of<DeviceProvider>(context, listen: false).updatetoken(uuid.v1().toString());
      ApiResponse res = await AssistantMethods.CreateDevice(uuid.v1().toString(), context);
      //to print only in debug mode
      if (kDebugMode) {
        print('(TRACE) CreateDevice:'+res.data.toString());
      }
    }
    else{
      var token = _preferences.getString("device_token");
      Provider.of<DeviceProvider>(context, listen: false).updatetoken(token!);
    }
  }

  @override
  void initState() {
    //to check device token to use for form as id to each device
    WelcomePage.init().then((_) {
      check_device_token_register();
    });


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Development Task - AIElements"),),
    body:Container(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: Center(
      child: Column(
      children: <Widget>[
        const SizedBox(height: 20,),
      Image.asset(
      Constant.assestimage+"task.png",
      fit: BoxFit.fitWidth,
      width: 220.0,
      alignment: Alignment.bottomCenter,
      ),
 const SizedBox(height: 50,),
 Column(
   children: [
       CustomButton(
         text: "Create new Form",
         onPressed: (){
           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) =>  const FirstPage(title: "Development Task - AIElements",)),
           );
         },
         icon: Icons.skip_next,
       ) ,

       const SizedBox(height: 20,),

       CustomButton(
         text: "Explore previous forms",
         onPressed: (){
           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) =>  const ThirdPage()),
           );
         },
         icon: Icons.skip_next,
       )

   ],
 )

]),
    ))

    );
  }
}
