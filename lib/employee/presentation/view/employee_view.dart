import 'package:data_handling/core/constants.dart';
import 'package:data_handling/employee/data/data_sources/employee_local_data_source.dart';
import 'package:data_handling/employee/data/data_sources/employee_remote_data_source.dart';
import 'package:data_handling/employee/data/model/employee_model.dart';
import 'package:data_handling/employee/data/repos/emplyoee_repo.dart';
import 'package:data_handling/employee/presentation/view/widgets/employee_body.dart';
import 'package:flutter/material.dart';

class EmployeeView extends StatefulWidget {
  const EmployeeView({super.key});

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
  StatesOfRequest requestState = StatesOfRequest.loading;
  final emplyoeeRepImp = EmplyoeeRepImp(
      employeeLocalDataSource: EmployeeLocalDataSourceImp(),
      employeeRemotDataSource: EmplyoeeRepoRemoteImpl());
  List<EmployeeModel> emoloyeeList = [];
  String errorMessage = '';
  Future<void> fetchData() async {
    // handle states of request
    requestState = StatesOfRequest.loading;
    setState(() {});
    // call repo method that call api request
    final result = await emplyoeeRepImp.getEmployeeData();
    result.fold((list) {
      // ensure to clear to avoid duplicate when make refresh indicator
      emoloyeeList.clear();
      emoloyeeList.addAll(
          list.toList()); // add into list with add all instead of making loop
      requestState = StatesOfRequest.success; // emit into success state
    }, (error) {
      // error message incase any error happen
      errorMessage = error;
      // emit into error state
      requestState = StatesOfRequest.error;
    });
    setState(() {});
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: EmployeeBody(
            refreshFun: () async {
              await fetchData();
            },
            requestState: requestState,
            emoloyeeList: emoloyeeList,
            errorMessage: errorMessage),
      ),
    ));
  }
}
