import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_demo/res/colors.dart';
import 'package:provider_demo/res/component/round_button.dart';
import 'package:provider_demo/utils/utils.dart';

import '../utils/routes/route_names.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    obscureText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: globalKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    child: TextFormField(
                      cursorColor: AppColors.primaryColor,
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 10,
                      validator: (value) {},
                      controller: emailController,
                      decoration: const InputDecoration(
                        counterText: '',
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primaryColor)),
                        hintText: "Mobile number",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    child: ValueListenableBuilder(
                      valueListenable: obscureText,
                      builder: (BuildContext context, value, Widget? child) {
                        return TextFormField(
                          cursorColor: AppColors.primaryColor,
                          obscureText: obscureText.value,
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'length should be greater than 6 chars';
                            }
                            return null;
                          },
                          controller: passController,
                          decoration: InputDecoration(
                              counterText: '',
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.primaryColor)),
                              hintText: "Password",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  obscureText.value = !obscureText.value;
                                },
                                color: AppColors.primaryColor,
                                icon: obscureText.value
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                              )),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RoundButton(
                    title: 'Login',
                    onTap: () {
                      Utils.dismissKeyBoard();
                      if (globalKey.currentState!.validate()) {
                        Utils.showToastMessage("logged in", context, () {});
                      } else {
                        Utils.showToastMessage("empty!", context, () {});
                      }
                    },
                    width: 350,
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
