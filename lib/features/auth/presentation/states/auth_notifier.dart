// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superpro/core/core.dart';
import 'package:superpro/core/extensions/context_ext.dart';
import 'package:superpro/core/utils/snackbar_util.dart';
import 'package:superpro/features/auth/data/dto/login_dto.dart';
import 'package:superpro/features/auth/data/dto/signup_dto.dart';
import 'package:superpro/features/auth/data/repository/auth_repository_impl.dart';
import 'package:superpro/features/auth/presentation/home.dart';

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier(AuthRepositoryImpl());
});

enum AuthState { initial, loading, authenticated, unauthenticated, error }

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    ref.watch(authRepoProvider);
    return AuthState.initial;
  }

  AuthNotifier(this._authRepo);
  final AuthRepositoryImpl _authRepo;
  void signUp({
    required SignUpDto payload,
    required BuildContext ctx,
  }) async {
    try {
      state = AuthState.loading;
      final res = await _authRepo.signUp(
        payload: SignUpDto(
          name: payload.name,
          email: payload.email,
          password: payload.password,
        ),
      );
      state = AuthState.authenticated;
      res.fold(
        (l) => showSnackBar(context: ctx, text: l.msg),
        (r) {
          res;
          if (kDebugMode) print(res);
          ctx.navigator.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
              (route) => false);
        },
      );
    } catch (e) {
      state = AuthState.error;

      ErrorResponse(msg: e.toString());
    }
  }

  void logIn({
    required LoginDto payload,
    required BuildContext ctx,
  }) async {
    try {
      state = AuthState.loading;
      final res = await _authRepo.login(
        payload: LoginDto(
          email: payload.email,
          password: payload.password,
        ),
      );
      state = AuthState.authenticated;
      res.fold(
        (l) => showSnackBar(context: ctx, text: l.msg),
        (r) {
          res;
          ctx.navigator.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
              (route) => false);
        },
      );
    } catch (e) {
      ErrorResponse(msg: e.toString());
    }
  }
}
