import 'dart:ffi';

class DataModel{
  String firstName;
  String lastName;
  //String politique;
  Long id;

  DataModel({
    required this.firstName,
    required this.lastName,
    //required this.politique,
    required this.id,
  });

  factory DataModel.fromJson(Map<String, dynamic> json){
    return DataModel(firstName: json["first_name"],
        lastName: json["last_name"],
       // politique: json["politique"],
        id: json["id"]);
  }
}
