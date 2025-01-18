import 'package:dartz/dartz.dart';
import 'package:data_handling/employee/data/data_sources/employee_local_data_source.dart';
import 'package:data_handling/employee/data/data_sources/employee_remote_data_source.dart';
import 'package:data_handling/employee/data/model/employee_model.dart';

abstract class EmplyoeeRepo {
  Future<Either<List<EmployeeModel>, String>> getEmployeeData();
}

class EmplyoeeRepImp implements EmplyoeeRepo {
  final EmployeeLocalDataSource employeeLocalDataSource;
  final EmplyoeeRepoRemoteDataSource employeeRemotDataSource;
  EmplyoeeRepImp(
      {required this.employeeLocalDataSource,
      required this.employeeRemotDataSource});
  @override
  Future<Either<List<EmployeeModel>, String>> getEmployeeData() async {
    try {
      List<EmployeeModel> list = [];
      list = await employeeLocalDataSource.getEmployeeData();
      if (list.isEmpty) {
        list = await employeeRemotDataSource.getEmployeeData();
        await employeeLocalDataSource.setEmployeeData(list);
      }
      return left(list);
    } catch (e) {
      return right(e.toString());
    }
  }
}
