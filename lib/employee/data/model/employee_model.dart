
class EmployeeModel {
  int? id;
  String? imageUrl;
  String? firstName;
  String? lastName;
  String? email;
  String? contactNumber;
  int? age;
  String? dob;
  int? salary;
  String? address;

  EmployeeModel({
    this.id,
    this.imageUrl,
    this.firstName,
    this.lastName,
    this.email,
    this.contactNumber,
    this.age,
    this.dob,
    this.salary,
    this.address,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> data) => EmployeeModel(
        id: data['id'] as int?,
        imageUrl: data['imageUrl'] as String?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        email: data['email'] as String?,
        contactNumber: data['contactNumber'] as String?,
        age: data['age'] as int?,
        dob: data['dob'] as String?,
        salary: data['salary'] as int?,
        address: data['address'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'imageUrl': imageUrl,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'contactNumber': contactNumber,
        'age': age,
        'dob': dob,
        'salary': salary,
        'address': address,
      };
}
