import 'package:flutter/foundation.dart';
import 'package:tibia/model/player_info_model.dart';

import '../services/web_service.dart';

enum PlayerState { IDLE, BUSY, ERROR }

class PlayerInfoViewModel with ChangeNotifier {
  PlayerState? _state;

  PlayerInfoModel? playerInfo;

  //!Eu não preciso desse construtor
  //!pois ele tem a função de buscar informações quando a tela é aberta pela primeira vez
  //!e não estamos fazendo o get em uma lista
  //!estamos precisando da ação de um botão para isso
  // PlayerInfoViewModel(String name) {
  //   playerInfo = null;
  //   _state = PlayerState.IDLE;
  //   getPlayerInfo(name); 
  // }

  PlayerState? get state => _state;

  set state(PlayerState? state) {
    _state = state;
    notifyListeners(); // vai notificar os lugares que estão ouvindo essa variavel "STATE"
  }

  Future<PlayerInfoModel?> getPlayerInfo(String name) async {
    try {     
      state = PlayerState.BUSY; // buscando dados (mostrar circularProgressIndicator)
      playerInfo = await WebService().getCharacter(name);
      state = PlayerState.IDLE; // depois que fez o get mostrar os dados na tela (modo ocioso)
      return playerInfo;
    } catch (e) {
      state = PlayerState.ERROR; // caso der erro (mostrar uma msg)
      return null;
    }
  }
}
