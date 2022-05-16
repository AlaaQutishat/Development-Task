import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:development_task/widgets/custome_floating_button.dart';
import 'package:development_task/widgets/custome_text_filed.dart';
import 'package:development_task/widgets/CustomDropdown.dart';

import 'package:provider/provider.dart';
import 'package:development_task/Utils/services/Api_Assistant_Methods.dart';
import '../models/AddFormResponse.dart';

import '../providers/Device_Provider.dart';
import '../providers/FirstPageProvider.dart';
import 'SecondPage.dart';

final Number_filed_controller = TextEditingController();

String type="";
class FirstPage extends StatefulWidget {

  const FirstPage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

@override
  void initState() {
  Future.delayed(Duration.zero, () async {
  Provider.of<FirstPageProvider>(context, listen: false).clear();
  
  });

  super.initState();
  }
  @override
  void dispose() {
    Number_filed_controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: textField("Number of Fields",isNumber: true,textController: Number_filed_controller)),
             const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(12)),
                  child: CustDropDown(
                    items: const [
                      CustDropdownMenuItem(
                        value: "Text",
                        child: Text("Text"),
                      ),
                      CustDropdownMenuItem(
                        value: "Numbers",
                        child: Text("Numbers"),
                      ),
                      CustDropdownMenuItem(
                        value: "Date",
                        child: Text("Date"),
                      )
                    ],
                    hintText: "Select Type",
                    borderRadius: 5,
                    onChanged: (val) {
                      Provider.of<FirstPageProvider>(context, listen: false).updatetype(val);
                      //to print only in debug mode
                      if (kDebugMode) {
                        print(val);
                      }

                    },
                  ),
                ),
              )

            ],
          ),
        ),
      ),
      floatingActionButton: floatingButton("next",(){
        createform();

      },Icons.navigate_next),
    );
  }
  createform() async {
    if(Number_filed_controller.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please Fill number of filed"),
      ));
      return;
    }
    if(Provider.of<FirstPageProvider>(context, listen: false).gettype()==""){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please select data type"),
      ));
      return;
    }
    AddFormResponse res = await AssistantMethods.Createform(Number_filed_controller.text,
        Provider.of<DeviceProvider>(context, listen: false).gettoken()
        , Provider.of<FirstPageProvider>(context, listen: false).gettype(),  context);
    if (kDebugMode) {
      print('(TRACE) createform:'+res.data.toString());
    }
    if(res.data=="0"){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Something Wrong Try again later"),
      ));
    }
    else if(res.data=="1"){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("successful create form"),
      ));
      movetosecondpage(res.form_id);
    }

  }
  movetosecondpage(formId){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  SecondPage(datatype:
      Provider.of<FirstPageProvider>(context, listen: false).gettype() ,
      filednumber: int.parse(Number_filed_controller.text),form_id: int.parse(formId),)),
    );
  }
}