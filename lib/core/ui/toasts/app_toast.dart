import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  FToast fToast;
  Duration toastDuration = const Duration(seconds: 3);

  AppToast(this.fToast);

  Positioned positionedToastBuilder(context, child) {
    return Positioned(
      left: 0,
      right: 0,
      top: kIsWeb ? 10 : 30,
      child: child,
    );
  }

  Widget basicToastBuilder(
      {required String message,
      IconData? icon = Icons.help,
      Color? iconColor = Colors.white,
      Color? boxColor = Colors.grey,
      Color? textColor = Colors.white}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      constraints: const BoxConstraints(
        minWidth: 200.0,
        maxWidth: 300.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: boxColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: textColor),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  void showSuccessToast(
      {String message = "Operazione completata con successo"}) {
    try {
      fToast.showToast(
        child: basicToastBuilder(
          message: message,
          icon: Icons.check_circle_outline_rounded,
          boxColor: Colors.green[300],
        ),
        positionedToastBuilder: positionedToastBuilder,
        toastDuration: toastDuration,
      );
    } catch (e) {
      print(e);
    }
  }

  void showErrorToast({String message = "Errore durante l'operazione"}) {
    try {
      fToast.showToast(
        child: basicToastBuilder(
          message: message,
          icon: Icons.error_outline_rounded,
          boxColor: Colors.red[300],
        ),
        positionedToastBuilder: positionedToastBuilder,
        toastDuration: toastDuration,
      );
    } catch (e) {
      print(e);
    }
  }

  void showLoadingToast({String message = "Caricamento in corso"}) {
    try {
      fToast.showToast(
        child: basicToastBuilder(
          message: message,
          icon: Icons.hourglass_empty_rounded,
          //boxColor: Theme.of(context).primaryColor[300],
        ),
        positionedToastBuilder: positionedToastBuilder,
        toastDuration: toastDuration,
      );
    } catch (e) {
      print(e);
    }
  }
}
