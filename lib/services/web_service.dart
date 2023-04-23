//aqui é onde escrevemos a requisição para a API


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tibia/constants/application_constants.dart';
import 'package:tibia/model/player_info_model.dart';

class WebService {
  
  Future<PlayerInfoModel?> getCharacter(String name) async {
    final response = await http.get(Uri.parse(ApplicationConstants.getCharacter(name)));
    if (response.statusCode == 200) {
      return PlayerInfoModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes))['characters']['character']);
    }
    return null;
  }
}

//!preciso acessar as chaves character igual da api
// Future<PlayerInfoModel?> getCharacter(String name) async {
//     final response = await http.get(Uri.parse(ApplicationConstants.getCharacter(name)));
//     if (response.statusCode == 200) {
//       return PlayerInfoModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
//     }
//     return null;
//   }