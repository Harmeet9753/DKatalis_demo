import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


class CommonUtils{


  static void hideKeyboard(){
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }


  static String reformatDate(DateTime dateTime){
    var newFormat = DateFormat("yyyy-MM-dd");
    var str = newFormat.format(dateTime);
    return str;
  }
}