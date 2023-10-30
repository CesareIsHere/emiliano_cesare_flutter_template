import 'package:emiliano_cesare_flutter_template/core/providers/session_notifier.dart';
import 'package:emiliano_cesare_flutter_template/core/ui/splash/loading_splash_page.dart';
import 'package:emiliano_cesare_flutter_template/features/auth/providers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DI extends ConsumerWidget {
  const DI({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      child: SessionDI(
        child: AuthenticationDI(
          child: child,
        ),
      ),
    );
  }
}

class SessionDI extends ConsumerWidget {
  const SessionDI({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(sessionNotifierProvider).when(
          loading: () => const LoadingSplashPage(),
          error: (err, stack) => const LoadingSplashPage(),
          data: (data) {
            return child;
          },
        );
  }
}

class AuthenticationDI extends ConsumerWidget {
  const AuthenticationDI({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authNotifierProvider).when(
          loading: () => const LoadingSplashPage(),
          error: (err, stack) => const LoadingSplashPage(),
          data: (data) {
            return child;
          },
        );
  }
}
