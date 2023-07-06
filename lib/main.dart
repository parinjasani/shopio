import 'package:flutter/material.dart';
import 'package:shopio/Routes/approutes.dart';
import 'package:shopio/preferences/pref_utils.dart';
import 'package:shopio/theme.dart';

 main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await PrefUtils.init();
   runApp(MyApp());
 }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: apptheme(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoute.splashscreen,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
