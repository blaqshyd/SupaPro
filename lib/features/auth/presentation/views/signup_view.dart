import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superpro/core/constants/constants.dart';
import 'package:superpro/core/extensions/extensions.dart';
import 'package:superpro/features/auth/data/dto/signup_dto.dart';
import 'package:superpro/features/auth/presentation/states/auth_notifier.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final name = TextEditingController();

  final email = TextEditingController();
  final password = TextEditingController();

  void onSignUp() async {
    ref.read(authNotifierProvider.notifier).signUp(
          payload: SignUpDto(
            name: name.text.trim(),
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

//? The appbar rebuilds every time state changes cos it's in a build method
  final appbar = AppConstants.appBar(AppAssets.twitta.txt());
// * creating a final variable outside of the build method fixes that

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
            // mainAxisSize: MainAxisSize.max,
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
              // ButtonUtil.filled(
              //   cta: () {
              //     onSignUp();
              //     if (kDebugMode) print('pressed');
              //   },
              //   text: 'Sign Up',
              //   bgColor: context.colorScheme.onSurface,
              // ).customLoader(isLoading),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.onSurface,
                  foregroundColor: context.colorScheme.onPrimary,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: AppConstants.borderRadius,
                  ),
                ),
                onPressed: onSignUp,
                child: 'Sign Up'.txt(),
              ).loader(AuthState.loading == isLoading),
              42.sbH,
              //  Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Icon(Iconsax.google_copy),
              //     Icon(Iconsax.apple_copy),
              //     Icon(Iconsax.facebook_copy),
              //   ],
              // ),
            ],
          ),
        ),
      )),
    );
  }
}
