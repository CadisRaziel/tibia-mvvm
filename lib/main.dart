import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tibia/view_model/player_infor_view_model.dart';
import 'package:tibia/views/character_view.dart';
import 'package:tibia/views/home/home_page.dart';
import 'package:tibia/views/mount_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //utilizamos o provider aqui
    return ChangeNotifierProvider<PlayerInfoViewModel>(
      create: (BuildContext context) => PlayerInfoViewModel(),
      child: MaterialApp(
        title: 'Tibia',
        theme: ThemeData(primarySwatch: Colors.cyan),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/character-view': (context) => const CharacterView(),
          '/mount': (context) => const MountPage(),
        }
      ),
    );
  }
}