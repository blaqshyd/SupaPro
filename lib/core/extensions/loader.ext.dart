import 'package:flutter/material.dart';
import 'package:superpro/core/constants/constants.dart';

extension LoadingWidget on Widget {
  Widget loader(bool isLoading) {
    return isLoading
        ? const SizedBox.square(
            dimension: 24,
            child: CircularProgressIndicator.adaptive(),
          )
        : this;
  }
}

extension LoadingButton on ElevatedButton {
  Widget loader(bool isLoading) {
    return isLoading
        ? ElevatedButton(
            style: ElevatedButton.styleFrom(
              // backgroundColor: context.colorScheme.onSurface,
              // foregroundColor: context.colorScheme.onPrimary,
              minimumSize: const Size(double.infinity, 60),
              shape: RoundedRectangleBorder(
                borderRadius: AppConstants.borderRadius,
              ),
            ),
            onPressed: null,
            child: const SizedBox.square(
              dimension: 24,
              child: CircularProgressIndicator.adaptive(),
            ),
          )
        : this;
  }
}
