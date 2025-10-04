import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_user.freezed.dart';
part 'network_user.g.dart';

@freezed
abstract class NetworkUserOfficialVerify {
  const factory NetworkUserOfficialVerify(
    int type,
    String desc,
  ) = _NetworkUserOfficialVerify;

  NetworkUserOfficialVerify.fromJson(Map<String, dynamic> json)
    => _$NetworkUserOfficialVerifyFromJson(json);
}