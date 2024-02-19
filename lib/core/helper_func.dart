// random color
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Color generateRandomColor() {
  const List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.indigo,
    Colors.cyan,
    Colors.amber,
    Colors.lime,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
  ];

  return colors[Random().nextInt(colors.length)];
}

void openUrl({String? url}) {
  launchUrl(Uri.parse("http://$url"));
}

void openMailApp({String? receiver, String? title, String? body}) {
  launchUrl(Uri.parse("mailto:$receiver?subject=$title&body=$body"));
}

//* Generates random uId
String generateRandomId({int length = 16}) {
  const charset = 'abcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random.secure();

  return List.generate(length, (index) {
    final randomIndex = random.nextInt(charset.length);
    return charset[randomIndex];
  }).join();
}
