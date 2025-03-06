import 'package:weather_app/core/utils/api_url.dart';

final class ApiUrlConstants {
  static String scheme = "https";
  static String host = "api.openweathermap.org";
  static String version = "data/2.5/";

  static String getApiUrl(String path) {
    return ApiUrl(scheme: scheme, host: host, path: version + path).setUpURL();
  }
}
