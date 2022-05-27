class PlayerStatus {
  static List words =
      "ape cat dog baboon elephant giraffe apple coconut monkey mice mouse pineapple android apple house fence python grail zerg terran llama fire policeman zebra lion university accept damage advice coffee camera"
          .split(' ');
  static int playerStreak = 0;
  static int bestStreak = 0;
  static String wordCopy = '';
  static int tries = 0;
  static int remainingTries = 6;
  static int remainingHints = 1;
  static List<String> selectedCharacters = [];
}
