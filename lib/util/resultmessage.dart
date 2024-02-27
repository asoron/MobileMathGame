import 'package:denemler/const.dart';
import 'package:flutter/material.dart';

class ResultMsg extends StatelessWidget {
  const ResultMsg(
      {super.key,
      required this.goToNext,
      required this.msg,
      required this.icon});

  final goToNext;
  final String msg;
  final icon;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.deepPurple,
        content: Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                msg,
                style: whiteTextStyle,
              ),
              GestureDetector(
                onTap: goToNext,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(8)),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
