class SignupTokenModel {
  final String accessToken;
  final String refersshToken;

  SignupTokenModel({required this.accessToken, required this.refersshToken});

  factory SignupTokenModel.fromjson(Map<String, dynamic> json) {
    return SignupTokenModel(
      accessToken: json["accessToken"],
      refersshToken: json["refreshToken"],
    );
  }
}
