import 'package:data_handling/employee/data/model/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsView extends StatelessWidget {
  const EmployeeDetailsView({super.key, required this.model});
  final EmployeeModel model;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            spacing: 10,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  )
                ]),
                child: Image.network(
                  width: 100,
                  model.imageUrl ?? "",
                  errorBuilder: (context, _, s) {
                    return Icon(
                      Icons.error,
                      color: Colors.redAccent,
                    );
                  },
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                "${model.firstName ?? ""} ${model.lastName ?? ""}",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              Row(
                spacing: 15,
                children: [
                  Expanded(
                      child: CustomEmployeeItem(
                          label: 'salary',
                          content:
                              '${model.salary != null ? model.salary! * 1000 : ''} LE')),
                  Expanded(
                      child: CustomEmployeeItem(
                          label: 'address',
                          content: '${model.address ?? ""} ')),
                ],
              ),
              CustomEmployeeItem(label: 'email', content: model.email??"")
            ],
          ),
        ),
      ),
    );
  }
}

class CustomEmployeeItem extends StatelessWidget {
  const CustomEmployeeItem(
      {super.key, required this.label, required this.content});
  final String label;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextFormField(
          readOnly: true,
          initialValue: content,
          enabled: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.5,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.5,
                )),
          ),
        )
      ],
    );
  }
}
