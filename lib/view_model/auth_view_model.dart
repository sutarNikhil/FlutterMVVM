import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider_demo/repository/auth_repository.dart';
import 'package:provider_demo/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final authRepository = AuthRepository();
  String? email, password;

  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    AuthRepository.loginApi(email, password).then((value) {
      Response response = value;
      logConsole(response.body);
      Utils.showToastMessage("Logged In", context, () {});
    });
    //     .onError((error, stackTrace) {
    //   logConsole(error.toString());
    // });
  }
}
