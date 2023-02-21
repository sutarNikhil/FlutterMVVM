import 'package:flutter/foundation.dart';

class Plus with ChangeNotifier {
  int value = 0;

  increment() {
    value++;
    notifyListeners();
  }
}
