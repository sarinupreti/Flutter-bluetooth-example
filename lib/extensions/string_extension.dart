import 'package:intl/intl.dart';

// final password = "";
// final key = Key.fromUtf8(''); //32 chars
// final iv = IV.fromUtf8(''); //16 chars

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String truncateTo(int maxLenght) =>
      (this.length <= maxLenght) ? this : '${this.substring(0, maxLenght)}...';

  // Future<String> encryptString() async {
  //   final eString = base64Url.encode(utf8.encode(this));
  //   final e = Encrypter(AES(key, mode: AESMode.cbc));
  //   final encryptedData = e.encrypt(eString, iv: iv);
  //   return encryptedData.base64;
  // }

  // Future<String> decryptString() async {
  //   final e = Encrypter(AES(key, mode: AESMode.cbc));
  //   final decryptedData = e.decrypt(Encrypted.fromBase64(this), iv: iv);
  //   return decryptedData;
  // }

  String moneyFormat() {
    if (this.length > 2) {
      var value = this;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    } else {
      return this;
    }
  }

  convertTimeStamp() {
    final removeTFromString = this.replaceFirst("T", " ");

    var formattedDate =
        DateFormat('yyyy-MM-dd H:mm:ss').parse(removeTFromString);

    final date = DateFormat('h:mm a - dd MMM yyyy').format(formattedDate);

    return date;
  }

  String returnDay() {
    final removeTFromString = this.replaceFirst("T", " ");

    var formattedDate =
        DateFormat('yyyy-MM-dd H:mm:ss').parse(removeTFromString);

    final data = DateFormat.d().format(formattedDate);

    print(data);

    return data;
  }

  String returnDayNumber() {
    final removeTFromString = this.replaceFirst("T", " ");

    var formattedDate =
        DateFormat('yyyy-MM-dd H:mm:ss').parse(removeTFromString);

    final data = DateFormat.d().format(formattedDate);

    return data;
  }
}
