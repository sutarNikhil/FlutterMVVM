import 'package:flutter/material.dart';
import 'package:provider_demo/utils/routes/route_names.dart';
import 'package:provider_demo/utils/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteNames.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
