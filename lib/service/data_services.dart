import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/data_model.dart';
class DataServices{
  //Nom de l'api
  String baseUrl = "https://deeloma.com/woolu/";
  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getCandidates';
    http.Response res =await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      if(res.statusCode==200){
        List<dynamic> list =json.decode(res.body);
         print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }else{
        return <DataModel>[];
      }
    }catch(e){
      print(e);
      return <DataModel>[];
    }
  }
}