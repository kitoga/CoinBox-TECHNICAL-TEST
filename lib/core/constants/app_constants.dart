class AppConstants {
  static const String appName = 'Riverpod MVVM Clean';
  static const String apiBaseUrl = 'https://jsonplaceholder.typicode.com';
  static const Duration apiTimeout = Duration(seconds: 30);
  static const int itemsPerPage = 10;

  // Storage keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
}

class AppRoutes {
  static const String home = '/';
  static const String userDetail = '/user-detail';
}
