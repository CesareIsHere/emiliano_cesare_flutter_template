import 'package:emiliano_cesare_flutter_template/core/providers/session_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  bool isSignedIn = false;
  @override
  FutureOr<void> build() async {
    /// Check here if the user has token or not
    var token = await ref.read(sessionNotifierProvider.notifier).getToken();
    isSignedIn = token != null;
  }

  // Future<bool> signOut({BuildContext? context}) async {
  //   try {
  //     isSignedIn = false;
  //     state = state;
  //     await getIt<SessionRepository>().clear();

  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // Future<bool> signIn(
  //     {required String email,
  //     required String password,
  //     required String? initialTenant}) async {
  //   var res = await ExceptionHandler.handle2(
  //     AuthenticationRepository().signIn(
  //       email: email,
  //       password: password,
  //       initialTenant: initialTenant,
  //     ),
  //     errorTitle: "Errore di autenticazione",
  //   );

  //   if (res.$1 == true) {
  //     isSignedIn = true;
  //     state = state;
  //     return true;
  //   }

  //   return false;
  // }

  // Future<dynamic> signUp({
  //   required String email,
  //   required String password,
  //   required String confirmPassword,
  //   required String name,
  //   required String surname,
  //   required String mobile,
  //   String? tenantCode,
  //   String? vatNumber,
  // }) async {
  //   var res = await ExceptionHandler.handle(
  //     AuthenticationRepository().signUp(
  //       email: email,
  //       password: password,
  //       confirmPassword: confirmPassword,
  //       name: name,
  //       surname: surname,
  //       mobile: mobile,
  //       tenantCode: tenantCode,
  //       vatNumber: vatNumber,
  //     ),
  //   );

  //   if (res != null) {
  //     isSignedIn = false;
  //     state = state;
  //   }

  //   return res;
  // }

  // Future<dynamic> forgotPassword(
  //     {required String email, String? initialTenant}) async {
  //   var res = await ExceptionHandler.handle(
  //     AuthenticationRepository()
  //         .forgotPassword(email: email, initialTenant: initialTenant),
  //   );

  //   if (res != null) {
  //     isSignedIn = false;
  //     state = state;
  //   }

  //   return res;
  // }

  // // changepassword
  // Future<dynamic> changePassword({
  //   required String forgotToken,
  //   required String newPassword,
  //   required String confirmPassword,
  // }) async {
  //   var res = await ExceptionHandler.handle(
  //     AuthenticationRepository().changePassword(
  //       forgotToken: forgotToken,
  //       newPassword: newPassword,
  //       confirmPassword: confirmPassword,
  //     ),
  //   );

  //   if (res != null) {
  //     isSignedIn = false;
  //     state = state;
  //   }

  //   return res;
  // }
}
