import 'package:data_handling/core/constants.dart';
import 'package:data_handling/employee/data/model/employee_model.dart';
import 'package:data_handling/employee/presentation/view/widgets/details_view.dart';
import 'package:data_handling/employee/presentation/view/widgets/employee_item.dart';
import 'package:flutter/material.dart';

class EmployeeBody extends StatelessWidget {
  const EmployeeBody({
    super.key,
    required this.requestState,
    required this.emoloyeeList,
    required this.errorMessage,
    required this.refreshFun,
  });

  final StatesOfRequest requestState;
  final List<EmployeeModel> emoloyeeList;
  final String errorMessage;
  final Future<void> Function() refreshFun;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title of screen
        Flexible(
            child: Text(
          "All Employee",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        )),
        // make switch for each state to show diffrent case .
        switch (requestState) {
          // show indicator in case loading
          StatesOfRequest.loading => Center(child: CircularProgressIndicator()),
          // return list of items in case success
          StatesOfRequest.success => Expanded(
              flex: 10,
              child: RefreshIndicator(
                onRefresh: refreshFun,
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return EmployeeItem(
                          navTo: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EmployeeDetailsView(
                                        model: emoloyeeList[index])));
                          },
                          key: Key('$index'),
                          model: emoloyeeList[index]);
                    },
                    itemCount: emoloyeeList.length),
              )),
          // show error message.
          StatesOfRequest.error => Center(
                child: Text(
              errorMessage,
              style: TextStyle(fontSize: 18),
            ))
        },
      ],
    );
  }
}
