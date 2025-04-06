import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'color_manger.dart';

class Utils {

  static void showCustomToast({
    required String msg,
  }) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: ColorManger.kPrimary,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  static void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }


}