import 'package:emiliano_cesare_flutter_template/features/auth/providers/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

GoRouter routerGenerator({required WidgetRef ref}) {
  return GoRouter(
    redirect: (context, state) {
      List<String> authRoutes = [];
      var isUserLogged = ref.read(authNotifierProvider.notifier).isSignedIn;

      if (isUserLogged) {
        if (authRoutes.contains(state.uri.toString())) {
          // return homepage
          return '/';
        }
      } else {
        if (authRoutes.contains(state.uri.toString())) {
          // It'ok
          return state.uri.toString();
        } else {
          // return login page
          return '/login';
        }
      }
      return null;
    },
    routes: [
      // GoRoute(
      //   name: TicketsView.route,
      //   path: TicketsView.route,
      //   builder: (context, state) {
      //     return TicketsView(params: state.uri.queryParameters);
      //   },
      //   routes: [
      //     GoRoute(
      //       name: TicketDetailView.routeName,
      //       path: TicketDetailView.routeName,
      //       builder: (context, state) {
      //         return TicketDetailView(
      //           ticketCode: state.pathParameters['ticketCode']!,
      //           params: state.uri.queryParameters,
      //         );
      //       },
      //     ),
      //   ],
      // ),
      // // /account
      // GoRoute(
      //   name: AccountView.route,
      //   path: AccountView.route,
      //   pageBuilder: (context, state) {
      //     final tenant = state.uri.queryParameters['tenant'];

      //     return NoTransitionPage(
      //       child: AccountView(
      //         params: state.uri.queryParameters,
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: LoginDashboard.loginRoute,
      //   path: LoginDashboard.loginRoute,
      //   pageBuilder: (context, state) {
      //     final token = state.uri.queryParameters['token'];
      //     final tenant = state.uri.queryParameters['tenant'];

      //     return NoTransitionPage(
      //       child: LoginDashboard(
      //         token: token,
      //         initialTab: LoginDashboardTabs.login,
      //         initialTenant: tenant,
      //       ),
      //     );
      //   },
      // ),
    ],
  );
}
