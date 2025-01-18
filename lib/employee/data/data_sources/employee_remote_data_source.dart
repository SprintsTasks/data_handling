import 'package:data_handling/core/functions/api_serivce.dart';
import 'package:data_handling/employee/data/model/employee_model.dart';

abstract class EmplyoeeRepoRemoteDataSource {
  Future<List<EmployeeModel>> getEmployeeData();
}

class EmplyoeeRepoRemoteImpl implements EmplyoeeRepoRemoteDataSource {
  final ApiService apiService = ApiService();
  @override
  Future<List<EmployeeModel>> getEmployeeData() async {
    // call api service to get data
    final result = await apiService.fetchData();
    List<EmployeeModel> employeeList = [];
    // incase status code is 200 which mean there is no error
    if (result.statusCode == 200) {
      for (var item in result.data) {
        employeeList.add(EmployeeModel.fromJson(item));
      }
    }
    return employeeList;
    //incase error happen from server
  }
}
