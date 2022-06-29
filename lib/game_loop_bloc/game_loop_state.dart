part of 'game_loop_bloc.dart';

@immutable
class GameLoopState extends Equatable {
  List<CardClass> myDeck;
  List<CardClass> enemyDeck;

  GameLoopState({
    required this.myDeck,
    required this.enemyDeck,
  });

  GameLoopState copyWith({
    List<CardClass>? myDeck,
    List<CardClass>? enemyDeck,
  }) {
    return GameLoopState(
      myDeck: myDeck ?? this.myDeck,
      enemyDeck: enemyDeck ?? this.enemyDeck,
    );
  }

  @override
  List<Object?> get props => [enemyDeck, myDeck];
}
