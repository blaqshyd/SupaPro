import 'package:flutter/material.dart';
import 'package:superpro/core/constants/app_constants.dart';
import 'package:superpro/core/extensions/extensions.dart';

void showSnackBar({required BuildContext context, String? text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Padding(
        padding: 12.padA,
        child: Text(text ?? 'Default Snackbar Text'),
      ),
      margin: EdgeInsets.only(
        bottom: context.mediaQuery.size.height - 120,
        left: 10,
        right: 10,
      ),

      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: AppConstants.borderRadius),
      // showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
