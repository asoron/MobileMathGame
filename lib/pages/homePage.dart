import 'dart:math';

import 'package:denemler/const.dart';
import 'package:denemler/util/numberKey.dart';
import 'package:denemler/util/resultmessage.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<String> numPad = [
    "7",
    "8",
    "9",
    "C",
    "4",
    "5",
    "6",
    "DEL",
    "1",
    "2",
    "3",
    "=",
    "0",
  ];

  int numberA = 1;
  int numberB = 1;

  String userAnswer = "";

  void buttonTaped(String Button) {
    setState(() {
      if (Button == "=")
        checkResult();
      else if (Button == "C")
        userAnswer = "";
      else if (Button == "DEL") {
        if (userAnswer.isNotEmpty)
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
      } else if (userAnswer.length < 3) userAnswer += Button;
    });
  }

  void checkResult() {
    if (numberA + numberB == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMsg(
                goToNext: goToNext, msg: "Correct!", icon: Icons.forward);
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMsg(
                goToNext: goBack, msg: "Try Again!", icon: Icons.rotate_left);
          });
    }
  }

  var randomNumber = Random();

  void goToNext() {
    Navigator.of(context).pop();

    setState(() {
      userAnswer = "";
    });

    numberA = randomNumber.nextInt(10);
    numberB = randomNumber.nextInt(10);
  }

  void goBack() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        children: [
          //levelProgress
          Container(
            height: 160,
            color: Colors.deepPurple,
          ),
          //question
          Expanded(
              flex: 2,
              child: Container(
                  child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        numberA.toString() + " + " + numberB.toString() + " = ",
                        style: whiteTextStyle),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple[400],
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child: Text(
                          userAnswer,
                          style: whiteTextStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ))),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                itemCount: numPad.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return MyButton(
                    child: numPad[index],
                    onTap: () => buttonTaped(numPad[index]),
                  );
                },
              ),
            ),
          ),
          //numberpad
        ],
      ),
    );
  }
}
