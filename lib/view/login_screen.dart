import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_demo/utils/utils.dart';

import '../utils/routes/route_names.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("This is login screen"),
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, RouteNames.home);
                      Utils.showToastMessage("Homescreen", context, () {});
                    },
                    child: Text("login")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
