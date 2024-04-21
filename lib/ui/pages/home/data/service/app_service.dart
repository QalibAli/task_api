import 'dart:io';

import 'package:api/constants/endpoints.dart';
import 'package:api/ui/pages/home/data/model/users_model.dart';
import 'package:dio/dio.dart';

class AppService {
  static Future<List<UsersModel>> getUsers() async {
    try {
     const usersEndpoint = Endpoints.users;
    final dio = Dio();
    final response = await dio.get(usersEndpoint);
    
    final List data = response.data;

    if(response.statusCode == 200){
      return data.map((e) => UsersModel.fromJson(e)).toList();
    }
    throw Exception();
    } on SocketException catch(e){
      print(e.message);
      throw Exception();
    }
     catch (e) {
      throw Exception();
    }
   

    
  }
}