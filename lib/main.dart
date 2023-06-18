import 'package:flutter/material.dart';
import 'package:shopio/Routes/approutes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoute.splashscreen,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
