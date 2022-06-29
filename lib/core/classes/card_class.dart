enum CardClass {
  explodingKitten,
  defuse,
  attack,
  favor,
  nope,
  shuffle,
  skip,
  seeTheFuture,
  cattermelon,
  beardCat,
  hairyPotatoCat,
  tacoCat,
  rainbowRalphingCat
}

class CardClassUtils {
  static const Map<CardClass, String> titles = {
    CardClass.explodingKitten: "ВЗРЫВНОЙ КОТЕНОК",
    CardClass.defuse: "ОБЕЗВРЕДЬ",
    CardClass.attack: "НАПАДАЙ",
    CardClass.favor: "ПОДЛИЖИСЬ",
    CardClass.nope: "НЕТЬ",
    CardClass.shuffle: "ЗАТАСУЙ",
    CardClass.skip: "СЛИЯНЙ",
    CardClass.seeTheFuture: "ПОДСМУТРИ ГРЯДУЩЕЕ",
    CardClass.cattermelon: "КОШКАРБУЗ",
    CardClass.beardCat: "БОРОДОКОТ",
    CardClass.hairyPotatoCat: "ВОЛОСАТАЯ КОШКА-КАРТОШКА",
    CardClass.tacoCat: "ТАКИКОТ",
    CardClass.rainbowRalphingCat: "НЯ-КОТ НАОБОРОТ"
  };

  static const Map<CardClass, int> cardCount = {
    CardClass.explodingKitten: 1,
    CardClass.defuse: 2,
    CardClass.attack: 4,
    CardClass.favor: 4,
    CardClass.nope: 5,
    CardClass.shuffle: 4,
    CardClass.skip: 4,
    CardClass.seeTheFuture: 5,
    CardClass.cattermelon: 4,
    CardClass.beardCat: 4,
    CardClass.hairyPotatoCat: 4,
    CardClass.tacoCat: 4,
    CardClass.rainbowRalphingCat: 4,
  };

  static String getTitleFromClass(CardClass cardClass) {
    if (titles.containsKey(cardClass)) {
      return titles[cardClass]!;
    } else {
      throw Exception("BAD CARDCLASS");
    }
  }

  static int getCardCountFromClass(CardClass cardClass) {
    if (cardCount.containsKey(cardClass)) {
      return cardCount[cardClass]!;
    } else {
      throw Exception("BAD CARDCLASS");
    }
  }
}
