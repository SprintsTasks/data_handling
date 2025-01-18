import 'dart:convert';
import 'package:data_handling/core/functions/local_service.dart';
import 'package:data_handling/employee/data/model/employee_model.dart';

abstract class EmployeeLocalDataSource {
  Future<List<EmployeeModel>> getEmployeeData();
  Future<void> setEmployeeData(List<EmployeeModel> emoloyeeList);
}

class EmployeeLocalDataSourceImp implements EmployeeLocalDataSource {
  LocalServiceData localServiceData = LocalServiceData();
  @override
  Future<List<EmployeeModel>> getEmployeeData() async {
    await localServiceData.initShared();
    List<EmployeeModel> list = [];
    String json = localServiceData.getDate;
    if (json != '') {
      final result = jsonDecode(localServiceData.getDate);
      for (var item in result) {
        list.add(EmployeeModel.fromJson(item));
      }
      return list;
    }
    return list;
  }

  @override
  Future<void> setEmployeeData(List<EmployeeModel> emoloyeeList) async {
    await localServiceData.setEmployeeData(jsonEncode(emoloyeeList));
  }
}
