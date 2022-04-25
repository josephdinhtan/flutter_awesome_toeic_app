import 'package:flutter/material.dart';

class AddFavoriteQuestionPanel extends StatelessWidget {
  AddFavoriteQuestionPanel({
    Key? key,
    required this.maxWidth,
    required this.onPressedOk,
    required this.onPressedCancel,
  }) : super(key: key);

  String noteStr = "";
  double maxWidth;
  Function() onPressedCancel;
  Function(String noteStr) onPressedOk;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width > maxWidth ? 0.7 * maxWidth : 0.7 * width,
      //height: width > maxWidth ? 0.7 * maxWidth : 0.7 * width,
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 1,
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Add a note',
            ),
            onChanged: (input) {
              noteStr = input;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                //style: const ButtonStyle(backgroundColor: Colors.transparent),
                child: const Text('Cancel'),
                onPressed: () {
                  onPressedCancel();
                },
              ),
              TextButton(
                //style: const NeumorphicStyle(color: Colors.transparent),
                child: const Text('OK'),
                onPressed: () {
                  onPressedOk(noteStr);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
