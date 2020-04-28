import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction{
  static String UserLoggedinKey = "USERLOGGEDINKEY";
  static saveUserLoggedInDetails({@required bool isLoggedin}) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(UserLoggedinKey, isLoggedin);
  }
  static Future<bool> getUserLoggedInDetails() async{
    SharedPreferences prefs = await SharedPreferences.getInstance(); 
    return prefs.getBool(UserLoggedinKey);
  }
}