import 'package:data_handling/employee/data/model/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeItem extends StatelessWidget {
  const EmployeeItem({super.key, required this.model, required this.navTo});
  final EmployeeModel model;
  final void Function()navTo;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            offset: Offset(0, 4),
          ),
        ]),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            child: Image.network(
              model.imageUrl ?? "",
              errorBuilder: (context, _, s) {
                return Icon(
                  Icons.error,
                  color: Colors.redAccent,
                );
              },
            ),
          ),
          title: Text(
            model.firstName ?? "",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle:
              model.salary != null ? Text('${model.salary! * 1000} \$') : null,
          trailing: IconButton(
              onPressed: navTo, icon: Icon(Icons.arrow_forward_ios_rounded)),
        ));
  }
}
