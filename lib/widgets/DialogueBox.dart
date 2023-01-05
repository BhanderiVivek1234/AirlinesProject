import 'package:flutter/material.dart';

void showDialogueBox(BuildContext context, String errorMsg) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(errorMsg),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(), child: Text("OK"))
        ],
      );
    },
  );
}
