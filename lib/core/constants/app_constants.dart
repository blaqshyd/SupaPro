import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  //! App Bar
  static AppBar appBar(Widget? title) {
    return AppBar(
      title: title,
    );
  }

  //! Padding
  static EdgeInsets padding = const EdgeInsets.symmetric(
    horizontal: 8,
    vertical: 12,
  );
  //! BorderRadius

  static BorderRadius borderRadius = BorderRadius.circular(12);

  static const String anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxibXpmcmhwY2Rud2F3cHJwa2lwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTAxMTI4OTcsImV4cCI6MjAwNTY4ODg5N30.Suo6k8pjJkrbiqBwCzF9n7GCouM9ZKEMDwMy-oqFP9k';
  static const apiUrl = 'https://randomuser.me/api/?results=50';
  static const String url = 'https://lbmzfrhpcdnwawprpkip.supabase.co';
}
