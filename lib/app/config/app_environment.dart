import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvironment {
  AppEnvironment._({required this.apiUrl, required this.apiKey})
      : assert(apiUrl.isNotEmpty && apiKey.isNotEmpty, 'Invalid env variables');

  final String apiUrl;
  final String apiKey;

  static Future<AppEnvironment> load() async {
    await dotenv.load(fileName: ".env");
    // If variables are not found assert throws an error
    return AppEnvironment._(
        apiUrl: dotenv.env['API_URL'] ?? "",
        apiKey: dotenv.env['API_KEY'] ?? "");
  }
}
