import 'package:flutter/material.dart';
import 'package:odc_hangman/GameLogicFuncions/GameLogicFunctions.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      child: Drawer(
        width: size.width * 0.8,
        backgroundColor: Colors.blue[800],
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Total Leaderboard',
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Name ',
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Best Streak ',
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                width: 70,
                child: Image.asset(
                  'assets/images/crown-.png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return itemBuilder(
                          name: allUsers[allUsers.length - (index + 1)].name,
                          score: allUsers[allUsers.length - (index + 1)].score);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 2,
                      );
                    },
                    itemCount: allUsers.length,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class itemBuilder extends StatelessWidget {
  String name;
  int score;
  itemBuilder({
    required this.name,
    required this.score,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$score',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
