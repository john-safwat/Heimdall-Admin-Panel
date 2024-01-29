
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:heimdalladmin/Providers/AppConfigProvider.dart';
import 'package:heimdalladmin/Theme/MyTheme.dart';
import 'package:heimdalladmin/UI/AddComponent/AddHardwareComponentView.dart';
import 'package:heimdalladmin/UI/Hardware/HardwareView.dart';
import 'package:heimdalladmin/UI/Home/HomeView.dart';
import 'package:heimdalladmin/firebase_options.dart';
import 'package:provider/provider.dart';

void main()async{
  // block the code building for the loading of data
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create:(context) => AppConfigProvider())
          ],
          child: MyApp(),
        )
  );

}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.routeName,
      theme: MyTheme.theme,
      routes: {
        HomeView.routeName : (context) => const HomeView(),
        HardwareView.routeName : (context) => const HardwareView(),
        AddHardwareView.routeName : (context) => AddHardwareView()
      },
    );
  }


}