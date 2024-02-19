import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:superpro/core/core.dart';
import 'package:superpro/features/auth/data/dto/login_dto.dart';
import 'package:superpro/features/auth/data/dto/signup_dto.dart';

abstract class AuthRepository {
  FutureEither<User> signUp({required SignUpDto payload});
  FutureEither<Session> login({required LoginDto payload});
}
