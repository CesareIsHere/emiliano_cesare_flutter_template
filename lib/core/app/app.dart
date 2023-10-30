import 'package:emiliano_cesare_flutter_template/core/app/di.dart';
import 'package:emiliano_cesare_flutter_template/core/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DI(
      child: MaterialApp.router(
        title: 'Template App',
        debugShowCheckedModeBanner: false,
        routerConfig: routerGenerator(ref: ref),
      ),
    );
  }
}
