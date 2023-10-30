import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingSplashPage extends ConsumerWidget {
  const LoadingSplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/atomscloud_logo.png',
            width: 200,
          ),
          const SizedBox(height: 16),
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          const Text(
            "Caricando...",
            textDirection: TextDirection.ltr,
          ),
        ],
      ),
    );
  }
}
