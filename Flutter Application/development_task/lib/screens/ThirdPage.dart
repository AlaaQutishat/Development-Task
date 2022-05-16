import 'package:development_task/providers/Device_Provider.dart';
import 'package:development_task/providers/Thirdpageprovider.dart';
import 'package:development_task/screens/First%20page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Constants/app_constants.dart';
import '../models/FormsModel.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  void getpreviousforms(token) {
    http.get(Uri.parse( "${Constant.apiurl}get_form.php?user_token=$token")).then((value) {
  var   forms = FormDataFromJson(value.body);
      Provider.of<ThirdpageProvider>(context, listen: false).updatepreviousforms(forms);
  Provider.of<ThirdpageProvider>(context, listen: false).updateloading(true);
    });


  }
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      Provider.of<ThirdpageProvider>(context, listen: false).clear();
      var token  =   Provider.of<DeviceProvider>(context, listen: false).gettoken();
      getpreviousforms(token);
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Padding(
        padding:  EdgeInsets.all(8.0),
        child:  Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Previous Forms"),
        ),
      ),
      actions:  [GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  const FirstPage( title: 'Development Task - AIElements',)),
            );
          },
          child: const Text("Create new Form"))],

      ),
      body: Provider.of<ThirdpageProvider>(context, listen: true).isloading ==false?
      const Center(child: CircularProgressIndicator (),)
          :
      Provider.of<ThirdpageProvider>(context, listen: true).previousforms.isEmpty?
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text("No date "),
        ),
      )
          :
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemCount: Provider.of<ThirdpageProvider>(context, listen: true).previousforms.length,
            itemBuilder: (context, index){
              var item =  Provider.of<ThirdpageProvider>(context, listen: true).previousforms[index];
              return   ExpansionTile(
                title: Text("Form $index"),
                backgroundColor: Colors.grey,
                collapsedBackgroundColor: Colors.white,
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("FiledNumber : "+item.filedsNumber),
                    Text(item.datetime)
                  ],
                ),
                children:  <Widget>[
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: item.filedValue.length,
                      itemBuilder: (BuildContext context, int index){
                        var itemfiled=item.filedValue[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Filed $index"),
                              Text(itemfiled.value)
                            ],
                          ),
                        );
                      },
                  separatorBuilder: (context, index){
                return const Divider(color: Colors.black,height: 5,);
              }
                  )
                ],
              );
            },
            separatorBuilder: (context, index){
              return const Divider(color: Colors.black,height: 5,);
            }
        ),
      ),

    );
  }
}

