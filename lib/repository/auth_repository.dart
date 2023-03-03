import 'package:provider_demo/data/network/network_service.dart';
import 'package:provider_demo/res/constants.dart';
import 'package:provider_demo/utils/utils.dart';

class AuthRepository {
  static Future<dynamic> loginApi(String email, String pass) async {
    try {
      dynamic data = {
        "username": email,
        "password": pass,
      };
      logConsole(" Input -> $data");
      dynamic response = NetworkService.postRequest(Constant.login, data);
      return response;
    } catch (e) {
      logConsole(e);
    }
  }
}
