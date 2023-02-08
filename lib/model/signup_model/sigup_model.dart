class SignUpModel {
  final String fullname;
  final String password;
  final String email;
  final String phone;

  SignUpModel({
    required this.fullname,
    required this.password,
    required this.email,
    required this.phone,
  });

  factory SignUpModel.from(Map<String, dynamic> json) {
    return SignUpModel(
      fullname: json["fullname"],
      password: json["password"],
      phone: json["phone"],
      email: json["email"],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "fullname": fullname,
      "email": email,
      "phone": phone,
      "password": password,
    };
  }
}
