import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tibia/constants/constants_color.dart';
import 'package:tibia/model/player_info_model.dart';
import 'package:tibia/view_model/player_infor_view_model.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({super.key});

  @override
  _CharacterViewState createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  final _nameController = TextEditingController();


  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
            TextField(
              style: TextStyle(
                  fontFamily: 'CELTG___',
                  color: title,
                  fontWeight: FontWeight.w900),
              controller: _nameController,
           
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  String playerName = _nameController.text;
                  if (playerName.isNotEmpty) {
                    // Aqui é onde você chama o método `getPlayerInfo` da view model
                    Provider.of<PlayerInfoViewModel>(context, listen: false)
                        .getPlayerInfo(playerName);
                  } else {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Error'),
                        content: Text('Please enter a player name'),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Image.asset(
                  "assets/submit.png",
                  height: 25,
                  width: 25,
                )),
            SizedBox(
              height: 20,
            ),
            /**
             * widget Consumer para ficar escutando as atualizações da PlayerInfoViewModel 
             * e exibir as informações na tela quando o estado da view model estiver IDLE 
             * e houver um objeto PlayerInfoModel válido na propriedade playerInfo.             
             */
            Consumer<PlayerInfoViewModel>(
              builder: (context, playerInfoViewModel, _) {
                // Aqui é onde você exibe as informações do jogador na tela
                // baseado no objeto `playerInfoViewModel.playerInfo`.
                // Por exemplo:
                if (playerInfoViewModel.state == PlayerState.IDLE &&
                    playerInfoViewModel.playerInfo != null) {
                  PlayerInfoModel playerInfo = playerInfoViewModel.playerInfo!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                            text: 'Name ➵ ',
                            style: TextStyle(
                                fontFamily: 'martel',
                                color: title,
                                fontWeight: FontWeight.w900),
                            children: [
                              const WidgetSpan(
                                child: SizedBox(height: 30),
                              ),
                              TextSpan(
                                text: '${playerInfo.name}',
                                style: TextStyle(
                                    fontFamily: 'CELTG___',
                                    color: title,
                                    fontWeight: FontWeight.w900),
                              ),
                            ]),
                      ),
                      Text.rich(
                        TextSpan(
                            text: 'Sex ➵ ',
                            style: TextStyle(
                                fontFamily: 'martel',
                                color: title,
                                fontWeight: FontWeight.w900),
                            children: [
                              const WidgetSpan(
                                child: SizedBox(height: 30),
                              ),
                              TextSpan(
                                text: '${playerInfo.sex}',
                                style: TextStyle(
                                    fontFamily: 'CELTG___',
                                    color: title,
                                    fontWeight: FontWeight.w900),
                              ),
                            ]),
                      ),
                      Text.rich(
                        TextSpan(
                            text: 'Title ➵ ',
                            style: TextStyle(
                                fontFamily: 'martel',
                                color: title,
                                fontWeight: FontWeight.w900),
                            children: [
                              const WidgetSpan(
                                child: SizedBox(height: 30),
                              ),
                              TextSpan(
                                text: '${playerInfo.title}',
                                style: TextStyle(
                                    fontFamily: 'CELTG___',
                                    color: title,
                                    fontWeight: FontWeight.w900),
                              ),
                            ]),
                      ),
                      Text.rich(
                        TextSpan(
                            text: 'Unlocked Titles ➵ ',
                            style: TextStyle(
                                fontFamily: 'martel',
                                color: title,
                                fontWeight: FontWeight.w900),
                            children: [
                              const WidgetSpan(
                                child: SizedBox(height: 30),
                              ),
                              TextSpan(
                                text: '${playerInfo.unlockedTitles}',
                                style: TextStyle(
                                    fontFamily: 'CELTG___',
                                    color: title,
                                    fontWeight: FontWeight.w900),
                              ),
                            ]),
                      ),
                      Text.rich(
                        TextSpan(
                            text: 'Vocation ➵ ',
                            style: TextStyle(
                                fontFamily: 'martel',
                                color: title,
                                fontWeight: FontWeight.w900),
                            children: [
                              const WidgetSpan(
                                child: SizedBox(height: 30),
                              ),
                              TextSpan(
                                text: '${playerInfo.vocation}',
                                style: TextStyle(
                                    fontFamily: 'CELTG___',
                                    color: title,
                                    fontWeight: FontWeight.w900),
                              ),
                            ]),
                      ),
                      Text.rich(
                        TextSpan(
                            text: 'Level ➵ ',
                            style: TextStyle(
                                fontFamily: 'martel',
                                color: title,
                                fontWeight: FontWeight.w900),
                            children: [
                              const WidgetSpan(
                                child: SizedBox(height: 30),
                              ),
                              TextSpan(
                                text: '${playerInfo.level}',
                                style: TextStyle(
                                    fontFamily: 'CELTG___',
                                    color: title,
                                    fontWeight: FontWeight.w900),
                              ),
                            ]),
                      ),
                      Text.rich(
                        TextSpan(
                            text: 'Achievement Points ➵ ',
                            style: TextStyle(
                                fontFamily: 'martel',
                                color: title,
                                fontWeight: FontWeight.w900),
                            children: [
                              const WidgetSpan(
                                child: SizedBox(height: 30),
                              ),
                              TextSpan(
                                text: '${playerInfo.achievementPoints}',
                                style: TextStyle(
                                    fontFamily: 'CELTG___',
                                    color: title,
                                    fontWeight: FontWeight.w900),
                              ),
                            ]),
                      ),
                      Text.rich(
                        TextSpan(
                            text: 'World ➵ ',
                            style: TextStyle(
                                fontFamily: 'martel',
                                color: title,
                                fontWeight: FontWeight.w900),
                            children: [
                              const WidgetSpan(
                                child: SizedBox(height: 30),
                              ),
                              TextSpan(
                                text: '${playerInfo.world}',
                                style: TextStyle(
                                    fontFamily: 'CELTG___',
                                    color: title,
                                    fontWeight: FontWeight.w900),
                              ),
                            ]),
                      ),
                      Text.rich(
                        TextSpan(
                            text: 'Residence ➵ ',
                            style: TextStyle(
                                fontFamily: 'martel',
                                color: title,
                                fontWeight: FontWeight.w900),
                            children: [
                              const WidgetSpan(
                                child: SizedBox(height: 30),
                              ),
                              TextSpan(
                                text: '${playerInfo.residence}',
                                style: TextStyle(
                                    fontFamily: 'CELTG___',
                                    color: title,
                                    fontWeight: FontWeight.w900),
                              ),
                            ]),
                      ),
                      Text.rich(
                        TextSpan(
                            text: 'Account Status ➵ ',
                            style: TextStyle(
                                fontFamily: 'martel',
                                color: title,
                                fontWeight: FontWeight.w900),
                            children: [
                              const WidgetSpan(
                                child: SizedBox(height: 30),
                              ),
                              TextSpan(
                                text: '${playerInfo.accountStatus}',
                                style: TextStyle(
                                    fontFamily: 'CELTG___',
                                    color: title,
                                    fontWeight: FontWeight.w900),
                              ),
                            ]),
                      ),
                    ],
                  );
                } else if (playerInfoViewModel.state == PlayerState.BUSY) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
