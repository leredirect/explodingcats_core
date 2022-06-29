part of 'game_loop_bloc.dart';

@immutable
abstract class GameLoopEvent {}

class GameLoopStartGameEvent extends GameLoopEvent {}

class GameLoopActionEvent extends GameLoopEvent {
  final CardClass cardClass;
  final Player? aim;

  GameLoopActionEvent({
    required this.cardClass,
    this.aim,
  });
}

class GameLoopEndMoveEvent extends GameLoopEvent{}
