import 'package:encrypt/encrypt.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

final password = "swipecomm@2020";
final key = Key.fromUtf8('thisisakeyforswipecomm@2020.inc.'); //32 chars
final iv = IV.fromUtf8('swipecomm@2020..'); //16 chars

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String truncateTo(int maxLenght) =>
      (this.length <= maxLenght) ? this : '${this.substring(0, maxLenght)}...';

  Future<String> encryptString() async {
    final eString = base64Url.encode(utf8.encode(this));
    final e = Encrypter(AES(key, mode: AESMode.cbc));
    final encryptedData = e.encrypt(eString, iv: iv);
    return encryptedData.base64;
  }

  Future<String> decryptString() async {
    final e = Encrypter(AES(key, mode: AESMode.cbc));
    final decryptedData = e.decrypt(Encrypted.fromBase64(this), iv: iv);
    return decryptedData;
  }

  convertTimeStamp() {
    final removeTFromString = this.replaceFirst("T", " ");

    var formattedDate =
        DateFormat('yyyy-MM-dd H:mm:ss').parse(removeTFromString);

    final date = DateFormat('h:mm a - dd MMM yyyy').format(formattedDate);

    return date;
  }
}
