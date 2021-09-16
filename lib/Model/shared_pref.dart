import 'package:shared_preferences/shared_preferences.dart';

Future<String> getLoginToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var stringValue = prefs.getString('token')!;
  return stringValue;
}
