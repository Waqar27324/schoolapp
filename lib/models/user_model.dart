class UserModel {
  String? id;
  String fullName;
  String email;
  String? profileUrl;
  DateTime? lastActivityDateTime;

  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    this.profileUrl,
    this.lastActivityDateTime,
  });
}
