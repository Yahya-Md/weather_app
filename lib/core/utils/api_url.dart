import 'package:flutter/foundation.dart';

final class ApiUrl {
  final String _scheme;
  final String _host;
  final String _path;

  ApiUrl({required String scheme, required String host, required String path})
      : _scheme = scheme,
        _host = host,
        _path = path;

  String setUpURL() {
    Uri uri = Uri(scheme: _scheme, host: _host, path: _path);
    debugPrint("Request to: $uri");
    return uri.toString();
  }
}
