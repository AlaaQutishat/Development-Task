import 'package:development_task/providers/FirstPageProvider.dart';
import 'package:development_task/providers/SecondPageProvider.dart';
import 'package:development_task/providers/Thirdpageprovider.dart';
import 'package:development_task/screens/Welcome%20Page.dart';
import 'package:flutter/material.dart';
import 'providers/Device_Provider.dart';
import 'screens/First page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DeviceProvider>(create: (_) => DeviceProvider()),
        ChangeNotifierProvider<FirstPageProvider>(create: (_) => FirstPageProvider()),
        ChangeNotifierProvider<SecondpageProvider>(create: (_) => SecondpageProvider()),
        ChangeNotifierProvider<ThirdpageProvider>(create: (_) => ThirdpageProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Development Task',
        theme: ThemeData(
         fontFamily: "Cairo",
          primarySwatch: Colors.blue,
        ),
        home:  const WelcomePage(),
      ),
    );
  }
}


