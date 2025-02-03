

import 'package:flutter/cupertino.dart';

class Utils{

  static closeKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
}