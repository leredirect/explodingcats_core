import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'game_loop_bloc/game_loop_bloc.dart';

class EnemyHUDWidget extends StatelessWidget {
  const EnemyHUDWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameLoopBloc, GameLoopState>(
      builder: (context, state) {
        return Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Center(child: Text(state.enemyDeck.length.toString())),
        );
      },
    );
  }
}
