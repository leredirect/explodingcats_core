import 'package:explodingcats/game_loop_bloc/game_loop_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'enemy_hud_widget.dart';
import 'hud_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _showOverlay = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              EnemyHUDWidget(),
              Spacer(),
              HUDWidget(),
            ],
          ),
          Visibility(
            visible: _showOverlay,
            child: Container(
              color: Colors.black.withOpacity(0.3),
              child: Center(
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      _showOverlay = false;
                    });
                    context.read<GameLoopBloc>().add(GameLoopStartGameEvent());
                  },
                  child: Text("НАЧАТЬ ИГРУ"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
