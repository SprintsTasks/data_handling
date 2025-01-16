import 'package:dartz/dartz.dart';
import 'package:data_handling/core/functions/api_serivce.dart';
import 'package:data_handling/employee/data/model/employee_model.dart';

abstract class EmplyoeeRepo {
  Future<Either<List<EmployeeModel>, String>> getEmployeeData();
}

class EmplyoeeRepoImpl implements EmplyoeeRepo {
  final ApiService apiService = ApiService();
  @override
  Future<Either<List<EmployeeModel>, String>> getEmployeeData() async {
    try {
      // call api service to get data
      final result = await apiService.fetchData();
      List<EmployeeModel> employeeList = [];
      // incase status code is 200 which mean there is no error
      if (result.statusCode == 200) {
        for (var item in result.data) {
          employeeList.add(EmployeeModel.fromJson(item));
        }

        return left(employeeList);
      }
      //incase error happen from server
      return right("error in code ${result.data}");
    } catch (e) {
      // incase error from parsing
      return right(e.toString());
    }
  }
}
