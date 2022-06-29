import 'package:explodingcats/core/classes/card_class.dart';

class MainDeckRepository {
  static final MainDeckRepository _mainDeckRepository =
      MainDeckRepository._internal();

  factory MainDeckRepository() {
    return _mainDeckRepository;
  }

  MainDeckRepository._internal();

  final List<CardClass> _mainDeck = [];

  void generateDeck() {
    for (var element in CardClassUtils.cardCount.entries) {
      List<CardClass> allCardsOfCurrentClass =
          List.generate(element.value, (index) => element.key);
      _mainDeck.addAll(allCardsOfCurrentClass);
    }
    _mainDeck.shuffle();
    while(!_mainDeck.getRange(0, 13).contains(CardClass.explodingKitten)) {
      _mainDeck.shuffle();
    }
    print(_mainDeck);
  }

  void shuffleDeck() => _mainDeck.shuffle();

  CardClass getCardFromDeck() {
    CardClass cardClass = _mainDeck.last;
    _mainDeck.removeLast();
    return cardClass;
  }
}
