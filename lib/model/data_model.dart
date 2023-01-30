import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));
String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel{

 late String first_name;
 late String last_name;

  int id_candidate;
// late String phone_number_voter;

  //String politique;
  //Long id;

  DataModel({
    this.first_name ="",
    this.last_name ="",

    this.id_candidate=0,
    //this.phone_number_voter="",
    //required this.createat
  });

  factory DataModel.fromJson(Map<String, dynamic> map) =>
      DataModel(
          first_name: map["first_name"],
        last_name: map["last_name"],

        id_candidate: map["id_candidate"],
       // phone_number_voter: map["phone_number_voter"],
       // politique: json["politique"],
       // id: json["id"]);
  );

  Map<String, dynamic> toJson() => {
    "id_candidate": id_candidate,
    "first_name": first_name,
    "last_name": last_name,
   // "phone_number_voter": phone_number_voter,
  };
}
