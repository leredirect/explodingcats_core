import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:explodingcats/core/classes/card_class.dart';
import 'package:explodingcats/core/repositories/game_loop_repository.dart';
import 'package:meta/meta.dart';

import '../core/classes/player.dart';

part 'game_loop_event.dart';

part 'game_loop_state.dart';

class GameLoopBloc extends Bloc<GameLoopEvent, GameLoopState> {
  GameLoopBloc() : super(GameLoopState(enemyDeck: [], myDeck: [])) {
    on<GameLoopStartGameEvent>(_onStartGame);
    on<GameLoopEndMoveEvent>(_onEndMove);
  }

  FutureOr<void> _onStartGame(
      GameLoopStartGameEvent event, Emitter<GameLoopState> emit) {
    MainDeckRepository().generateDeck();
    for (int i = 0; i < 7; i++) {
      state.myDeck.add(MainDeckRepository().getCardFromDeck());
      state.enemyDeck.add(MainDeckRepository().getCardFromDeck());
    }

    state.myDeck.add(CardClass.defuse);
    state.enemyDeck.add(CardClass.defuse);
    emit(state);
  }

  FutureOr<void> _onEndMove(
      GameLoopEndMoveEvent event, Emitter<GameLoopState> emit) {
    List<CardClass> newDeck = List.from(state.myDeck);
    newDeck.add(MainDeckRepository().getCardFromDeck());
    emit(state.copyWith(myDeck: newDeck));
  }
}
