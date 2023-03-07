import 'package:shared_preferences/shared_preferences.dart';

 class Shared_Preferences{

  Future<int> getIntValue() async {
   final prefs = await SharedPreferences.getInstance();
   return prefs.getInt('intValue') ?? 0;
  }

  saveIntValue(String key,int value) async {
   final prefs = await SharedPreferences.getInstance();
   return prefs.setInt(key, value);
  }


  selectedCompanyID(String key,int value) async {
   final prefs = await SharedPreferences.getInstance();
   return prefs.setInt(key, value);
  }
  Future<int> getselectedCompanyID() async {
   final prefs = await SharedPreferences.getInstance();
   return prefs.getInt('intValue') ?? 0;
  }


  setStringValue(String key, String value) async {
   SharedPreferences myPrefs = await SharedPreferences.getInstance();
   myPrefs.setString(key, value);
  }
  Future<String> getStringValue(String key) async {
   SharedPreferences myPrefs = await SharedPreferences.getInstance();
   return myPrefs.getString(key) ?? "";
  }

  setBooleanValue(String key, bool value) async {
   SharedPreferences myPrefs = await SharedPreferences.getInstance();
   myPrefs.setBool(key, value);
  }
  Future<bool> getBooleanValue(String key) async {
   SharedPreferences myPrefs = await SharedPreferences.getInstance();
   return myPrefs.getBool(key) ?? false;
  }


  Future<bool> setToken(String Access_Token) async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   print("SANDY");
   return prefs.setString("token", Access_Token);
  }
  Future<bool> setLoggedIn(bool status) async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.setBool("logged_in", status);
  }

  Future<bool> getLogedIn() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getBool("logged_in") ?? false;
  }
  Future<String> getToken() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   print("SANDY VALLAVAN");
   return prefs.getString("token") ?? '';
  }


  Future<List<String>> getSocialMediaTypes() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getStringList("SocialMediaTypes") ?? [];
  }
  Future<bool> setSocialMediaTypes(List<String> socialMediaTypes) async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.setStringList("SocialMediaTypes", socialMediaTypes);
  }



  removeAll() async{
   SharedPreferences myPrefs = await SharedPreferences.getInstance();
   return myPrefs.clear();
  }

 }