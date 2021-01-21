import 'dart:convert';

class WebsiteAuth {
  final String username = "";
  final String password = "";

  String websiteAuth() {
    return base64Encode(utf8.encode('$username:$password'));
  }
}
