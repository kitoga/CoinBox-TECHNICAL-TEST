// core/utils/date_formatter.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  String toReadableFormat() {
    return DateFormat('MMM dd, yyyy – hh:mm a').format(this);
  }
}

// core/constants/app_constants.dart
class AppConstants {
  static const String apiBaseUrl = 'https://api.example.com';
  static const Duration apiTimeout = Duration(seconds: 30);
  static const int itemsPerPage = 20;
}

// core/widgets/loading_indicator.dart
class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
