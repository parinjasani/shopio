import 'package:flutter/material.dart';
import 'package:shopio/Routes/approutes.dart';
import 'package:shopio/theme.dart';

void main() => runApp(MyApp());

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
