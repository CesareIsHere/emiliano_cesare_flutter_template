// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:emiliano_cesare_flutter_template/core/ui/buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SecurityCheckDialog {
  static Future<dynamic> show(
      BuildContext context, Function()? onConfirmPressed) async {
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.warning, color: Colors.red),
              SizedBox(width: 5),
              Text('Attenzione!'),
            ],
          ),
          content: Container(
              constraints: BoxConstraints(minWidth: 350),
              child: Text("Questa operazione e' irreversibile. Continuare?")),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Annulla'),
            ),
            CustomElevatedButton(
              onPressed: () async {
                if (onConfirmPressed != null) {
                  print('onConfirmPressed');
                  await onConfirmPressed();
                }
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: Text('Conferma'),
            ),
          ],
        );
      },
    );
  }
}
