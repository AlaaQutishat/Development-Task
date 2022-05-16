import 'package:development_task/models/ApiResponse.dart';
import 'package:development_task/screens/ThirdPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:development_task/Utils/services/Api_Assistant_Methods.dart';
import '../providers/SecondPageProvider.dart';
import '../widgets/CustomeDataPicker.dart';
import '../widgets/custome_floating_button.dart';
import '../widgets/custome_text_filed.dart';
class SecondPage extends StatefulWidget {
  final String datatype;
  final int  filednumber;
  final int  form_id;

  const SecondPage({Key? key, required this.datatype, required this.filednumber, required this.form_id}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      Provider.of<SecondpageProvider>(context, listen: false).generatecontrollers(widget.filednumber);
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(title:const Text("Fill Filed") ),
        floatingActionButton: floatingButton("save",(){
         var values=Provider.of<SecondpageProvider>(context, listen: false).getcontrollersvalues();
         savevalues(values);
        },Icons.save),
        body: widget.datatype=="Text"?

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              itemCount:  Provider.of<SecondpageProvider>(context, listen: true).controllers.length,
              itemBuilder: (context, index){
                return   textField("Filed $index",isNumber: false,
                    textController: Provider.of<SecondpageProvider>(context, listen: false).controllers[index]);
              },
              separatorBuilder: (context, index){
                return const Divider(color: Colors.black,height: 5,);
              }
          ),
        ) :
        widget.datatype=="Numbers"?
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              itemCount:  Provider.of<SecondpageProvider>(context, listen: true).controllers.length,
              itemBuilder: (context, index){
                return   textField("Filed $index",isNumber: true,
                    textController: Provider.of<SecondpageProvider>(context, listen: false).controllers[index]);
              },
              separatorBuilder: (context, index){
                return const Divider(color: Colors.black,height: 5,);
              }
          ),
        ) :
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              itemCount:  Provider.of<SecondpageProvider>(context, listen: true).controllers.length,
              itemBuilder: (context, index){
                return   datapicker("DataPicker $index",
                        () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            initialDate: DateTime.now(),
                            // if need make picker only today and before
                            // selectableDayPredicate: (day) => day.isBefore(DateTime.now()),
                          );
                          if (selectedDate != null) {
                            var day = selectedDate.day.toString().length==1?"0"+selectedDate.day.toString():selectedDate.day.toString();
                            var month = selectedDate.month.toString().length==1?"0"+selectedDate.month.toString():selectedDate.month.toString();

                            Provider.of<SecondpageProvider>(context, listen: false).controllers[index].text=
                                day+"-"+month+"-"+selectedDate.year.toString();

                          }
                    },
                    textController: Provider.of<SecondpageProvider>(context, listen: false).controllers[index]

                   );
              },
              separatorBuilder: (context, index){
                return const Divider(color: Colors.black,height: 5,);
              }
          ),
        )

        ,
      );


  }
  savevalues(values) async {
    ApiResponse res = await AssistantMethods.saveformdata(widget.form_id.toString(),values,  context);
    if (kDebugMode) {
      print('(TRACE) savevalues:'+res.data.toString());
    }
    if(res.data=="0"){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Something Wrong Try again later"),
      ));
    }
    if(res.data=="1"){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("The data saved"),
      ));
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  const ThirdPage()),
    );
  }
}
