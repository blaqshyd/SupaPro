import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:superpro/core/constants/constants.dart';
import 'package:superpro/core/extensions/extensions.dart';
import 'package:superpro/features/auth/data/dto/login_dto.dart';
import 'package:superpro/features/auth/presentation/states/auth_notifier.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final email = TextEditingController();
  final password = TextEditingController();

  void onLogin() async {
    ref.read(authNotifierProvider.notifier).logIn(
          payload: LoginDto(
            email: email.text.trim(),
            password: password.text.trim(),
          ),
          ctx: context,
        );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  final appbar = AppConstants.appBar(AppAssets.twitta.txt());
  final AuthState state = AuthState.loading;

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: appbar,
      body: SafeArea(
          child: Padding(
        padding: AppConstants.padding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoTextField(
                controller: email,
                placeholder: 'johndoe@gmail.com',
                padding: 22.padA,
              ),
              16.sbH,
              CupertinoTextField(
                controller: password,
                placeholder: ' *** *** ***',
                padding: 22.padA,
              ),
              42.sbH,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.onSurface,
                  foregroundColor: context.colorScheme.onPrimary,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: AppConstants.borderRadius,
                  ),
                ),
                onPressed: onLogin,
                child: 'Login'.txt(),
              ).loader(state == isLoading),
              42.sbH,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Iconsax.google_copy),
                  Icon(Iconsax.apple_copy),
                  Icon(Iconsax.facebook_copy),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
