import 'package:data_handling/core/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalServiceData {
  static late SharedPreferences sharedPreferences;
  Future<void> initShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setEmployeeData(String data) async {
    await initShared();
    await sharedPreferences.setString(employeeListKey, data);
  }

  String get getDate => sharedPreferences.getString(employeeListKey) ?? "";
}
