import "dart:developer" as dev_tools show log;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension WidgetExtensions on num {
  Widget get sbH => SizedBox(height: toDouble());
  Widget get sbW => SizedBox(width: toDouble());

  EdgeInsetsGeometry get padV => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsetsGeometry get padH => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsetsGeometry get padA => EdgeInsets.all(toDouble());
  EdgeInsetsGeometry pad({
    num left = 0.0,
    num right = 0.0,
    num top = 0.0,
    num bottom = 0.0,
  }) =>
      EdgeInsets.only(
        left: left.toDouble(),
        right: right.toDouble(),
        top: top.toDouble(),
        bottom: bottom.toDouble(),
      );
}

extension ImagePath on String {
  String get png => 'lib/assets/images/$this.png';
  String get jpg => 'lib/assets/images/$this.jpg';
  String get gif => 'lib/assets/images/$this.gif';
}

extension VectorPath on String {
  String get svg => 'lib/assets/vectors/$this.svg';
}

extension NumExtensions on int {
  num addPercentage(num v) => this + ((v / 100) * this);
  num getPercentage(num v) => ((v / 100) * this);
}

extension NumExtensionss on num {
  num addPercentage(num v) => this + ((v / 100) * this);
  num getPercentage(num v) => ((v / 100) * this);
}

//! LOG EXTENSION - THIS HELPS TO CALL A .log() ON ANY OBJECT
extension Log on Object {
  void log() => dev_tools.log(toString());
}

//! HELPS TO CALL A .dismissKeyboard ON A WIDGET
extension DismissKeyboard on Widget {
  void dismissKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
}

const ext = 0;
final formatCurrency = NumberFormat.simpleCurrency(
  locale: Platform.localeName,
  name: 'NGN',
);

//Formats the amount and returns a formatted amount
String formatPrice(String amount) {
  return formatCurrency.format(num.parse(amount)).toString();
}

extension StringCasingExtension on String {
  String? camelCase() => toBeginningOfSentenceCase(this);
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
  String? trimToken() => contains(":") ? split(":")[1].trim() : this;
  String? trimSpaces() => replaceAll(" ", "");
  String removeSpacesAndLower() => replaceAll(' ', '').toLowerCase();
}
