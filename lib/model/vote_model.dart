import 'dart:convert';

VoteModel dataModelFromJson(String str) => VoteModel.fromJson(json.decode(str));
String dataModelToJson(VoteModel data) => json.encode(data.toJson());

class VoteModel{

  int id_candidate;
 late String phone_number_voter;

  //String politique;
  //Long id;

  VoteModel({

    this.id_candidate=0,
    this.phone_number_voter="",
    //required this.createat
  });

  factory VoteModel.fromJson(Map<String, dynamic> map) =>
      VoteModel(


        id_candidate: map["id_candidate"],
         phone_number_voter: map["phone_number_voter"],
        // politique: json["politique"],
        // id: json["id"]);
      );

  Map<String, dynamic> toJson() => {
    "id_candidate": id_candidate,
     "phone_number_voter": phone_number_voter,
  };
}
