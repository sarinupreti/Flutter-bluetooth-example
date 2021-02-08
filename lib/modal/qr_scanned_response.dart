import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_scanned_response.g.dart';

@JsonSerializable()
class QRScannedResponse {
  final String id;
  final bool value;

  QRScannedResponse(this.id, this.value);

  static const fromJson = _$QRScannedResponseFromJson;

  Map<String, dynamic> toJson() => _$QRScannedResponseToJson(this);
}
