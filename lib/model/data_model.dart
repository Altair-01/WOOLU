import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));
String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel{

 late String first_name;
 late String last_name;
  //String politique;
  //Long id;

  DataModel({
    this.first_name ="",
    this.last_name="",
    //required this.createat
  });

  factory DataModel.fromJson(Map<String, dynamic> map) =>
      DataModel(
          first_name: map["first_name"],
        last_name: map["last_name"],
       // politique: json["politique"],
       // id: json["id"]);
  );

  Map<String, dynamic> toJson() => {
    "last_name": last_name,
    "first_name": first_name,  };
}
