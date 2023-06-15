import 'package:flutter/material.dart';

void showConfirmationDialogAndExecute(
    {required BuildContext context,
    required String title,
    required String message,
    required String cancelName,
    required Function onConfirm,
    String confirmText = 'Confirm',
    String? thirdOptionName,
    Function? thirdOptionFunc}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(cancelName),
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.black)),
              onPressed: () {
                onConfirm();
                Navigator.pop(context);
              },
              child: Text(confirmText),
            ),
            thirdOptionName != null && thirdOptionFunc != null
                ? TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black)),
                    onPressed: () {
                      thirdOptionFunc();
                      Navigator.pop(context);
                    },
                    child: Text(thirdOptionName),
                  )
                : Container(),
          ],
        );
      });
}
