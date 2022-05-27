import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:odc_hangman/Screens/MyDrawer/MyDrawer.dart';

import '../../Compounents/CharacterBuilder.dart';
import '../../GameLogicFuncions/GameLogicFunctions.dart';
import '../../PlayerStatusClass/PlayerStatusClass.dart';
import '../../Compounents/ImageBuilder.dart';
import '../../Shared/CasheHelper.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String word = generateRandomWord();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List alphabets = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z',
    ];

    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        backgroundColor: Colors.blue[800],
        appBar: AppBar(
          elevation: 0,
          title: const Text('HangMan'),
          backgroundColor: Colors.blue[800],
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: InkWell(
                onTap: () {
                  String hintChacter = giveMeHint(word);

                  if (PlayerStatus.remainingHints != 1) {
                    showToast('you only have one hint', Colors.red);
                  } else {
                    showToast("Hint letter is: $hintChacter", Colors.green);
                    setState(() {
                      PlayerStatus.remainingHints--;
                    });
                  }
                },
                child: const Icon(
                  Icons.lightbulb,
                  size: 35,
                  color: Colors.yellowAccent,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (currentUserInfo!.score > 0)
                  Text(
                    'Your best Streak is ${currentUserInfo!.score}',
                    style: const TextStyle(
                      fontSize: 20, color: Colors.white,
                      fontWeight: FontWeight.bold,
                      // color: Colors.
                    ),
                  ),
                Text(
                  'Your current Streak is ${PlayerStatus.bestStreak}',
                  style: const TextStyle(
                    fontSize: 20, color: Colors.white,
                    fontWeight: FontWeight.bold,
                    // color: Colors.
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: size.height * 0.29,
                  child: Stack(
                    children: [
                      Center(
                        child: imageBuilder(PlayerStatus.tries >= 0,
                            'assets/images/hang.png', context),
                      ),
                      Center(
                        child: imageBuilder(PlayerStatus.tries >= 1,
                            'assets/images/head.png', context),
                      ),
                      Center(
                        child: imageBuilder(PlayerStatus.tries >= 2,
                            'assets/images/body.png', context),
                      ),
                      Center(
                        child: imageBuilder(PlayerStatus.tries >= 3,
                            'assets/images/la.png', context),
                      ),
                      Center(
                        child: imageBuilder(PlayerStatus.tries >= 4,
                            'assets/images/ra.png', context),
                      ),
                      Center(
                        child: imageBuilder(PlayerStatus.tries >= 5,
                            'assets/images/ll.png', context),
                      ),
                      Center(
                        child: imageBuilder(PlayerStatus.tries >= 6,
                            'assets/images/rl.png', context),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Remaining Tries ${PlayerStatus.remainingTries}',
                      style: const TextStyle(
                        fontSize: 18, color: Colors.white,
                        fontWeight: FontWeight.bold,
                        // color: Colors.
                      ),
                    ),
                    Text(
                      'Remaining Hints ${PlayerStatus.remainingHints}',
                      style: const TextStyle(
                        fontSize: 18, color: Colors.white,
                        fontWeight: FontWeight.bold,
                        // color: Colors.
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Wrap(
                  spacing: size.width * 0.02,
                  runSpacing: size.height * 0.01,
                  children: word
                      .split('')
                      .map((e) => characterBuilder(
                          e,
                          !PlayerStatus.selectedCharacters
                              .contains(e.toUpperCase()),
                          context))
                      .toList(),
                ),
                SizedBox(
                  height: size.height * 0.014,
                ),
                PlayerStatus.tries < 6
                    ? SizedBox(
                        width: double.infinity,
                        height: size.height * 0.25,
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 8,
                          mainAxisSpacing: 2.0,
                          crossAxisSpacing: 2.0,
                          padding: const EdgeInsets.all(9.0),
                          children: alphabets.map((element) {
                            return MaterialButton(
                              onPressed: () {
                                setState(
                                  () {
                                    PlayerStatus.selectedCharacters
                                        .add(element);

                                    if (!word
                                        .split('')
                                        .contains(element.toUpperCase())) {
                                      PlayerStatus.tries++;
                                      PlayerStatus.remainingTries--;
                                    } else {
                                      PlayerStatus.wordCopy =
                                          PlayerStatus.wordCopy.replaceAll(
                                              element.toUpperCase(), '');
                                    }
                                  },
                                );
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              color: PlayerStatus.selectedCharacters
                                      .contains(element)
                                  ? Colors.green
                                  : Colors.blue,
                              child: Text(
                                element,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.height * 0.03,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    : Column(
                        children: [
                          const Text(
                            'Your killed me ',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.07,
                          ),
                          Text(
                            'The Word is $word ',
                            style: const TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                newChallenge(false);
                                word = generateRandomWord();
                                // if (PlayerStatus.bestStreak > score) {}
                              });
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.replay_outlined,
                                  size: size.height * 0.1,
                                  color: Colors.white,
                                ),
                                const Text(
                                  'play again ',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                if (PlayerStatus.wordCopy == '')
                  TextButton(
                    onPressed: () {
                      PlayerStatus.bestStreak++;

                      setState(() {
                        if (PlayerStatus.bestStreak >= currentUserInfo!.score) {
                          currentUserInfo!.score = PlayerStatus.bestStreak;
                          updateeUserScore(score: currentUserInfo!.score);
                        }

                        newChallenge(true);
                        word = generateRandomWord();
                      });
                    },
                    child: const Text(
                      'Next Challenge',
                      style: TextStyle(
                        fontSize: 20, color: Colors.white,
                        fontWeight: FontWeight.bold,
                        // color: Colors.
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

showToast(String character, Color color) => Fluttertoast.showToast(
      msg: character,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );



/**
         condition:
            CashHelper.getDate(key: 'id') != '' && currentUserInfo != null,
        fallback: (context) => const Center(child: CircularProgressIndicator()),






 */