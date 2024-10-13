import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  String text;

  int index;

  //call back function
  Function onButtonClicked;

  BoardButton({
    super.key,
    required this.text,
    required this.index,
    required this.onButtonClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: () {
            onButtonClicked(index);
          },
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
