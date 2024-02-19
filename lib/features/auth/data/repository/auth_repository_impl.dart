import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:superpro/core/core.dart';
import 'package:superpro/features/auth/data/dto/login_dto.dart';
import 'package:superpro/features/auth/data/dto/signup_dto.dart';
import 'package:superpro/features/auth/domain/repositories/auth_repository.dart';

final authRepoProvider = Provider((ref) => AuthRepositoryImpl());

class AuthRepositoryImpl implements AuthRepository {
  final supabase = Supabase.instance.client;

  @override
  FutureEither<Session> login({required LoginDto payload}) async {
    try {
      final res = await supabase.auth.signInWithPassword(
        email: payload.email,
        password: payload.password,
      );
      return right(res.session!);
    } on AuthException catch (e) {
      return left(ErrorResponse(msg: e.message));
    } catch (e) {
      return left(ErrorResponse(msg: e.toString()));
    }
  }

  @override
  FutureEither<User> signUp({
    required SignUpDto payload,
    MapString? data,
  }) async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: payload.email,
        password: payload.password,
        data: {
          "name": payload.name,
        },
      );
      return right(res.user!);
    } on AuthException catch (e) {
      return left(ErrorResponse(msg: e.message));
    } catch (e) {
      return left(ErrorResponse(msg: e.toString()));
    }
  }
}
