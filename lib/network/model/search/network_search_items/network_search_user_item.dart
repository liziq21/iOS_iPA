library augment '../network_search_item.dart';

augment class NetworkSearchItem {
  @FreezedUnionValue('bili_user')
  const factory NetworkSearchItem.biliUser(
    String type,
    int mid,
    String uname,
    String usign,
    int fans,
    int videos,
    String upic,
    @JsonKey(name: 'face_nft')
    int faceNft,
    @JsonKey(name: 'face_nft_type')
    int faceNftType,
    @JsonKey(name: 'verify_info')
    String verifyInfo,
    int level,
    int gender,
    @JsonKey(name: 'is_upuser')
    int isUpUser,
    @JsonKey(name: 'is_live')
    int isLive,
    @JsonKey(name: 'room_id')
    int roomId,
    @JsonKey(name: 'official_verify')
    NetworkUserOfficialVerify officialVerify,
    @JsonKey(name: 'is_senior_member')
    int isSeniorMember,
  ) = NetworkSearchUserItem;
}