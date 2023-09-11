class AuthenticationCode {
  String otp;
  String message;

  AuthenticationCode({
    required this.otp,
    required this.message,
  });

  factory AuthenticationCode.fromJson(Map<String, dynamic> json) =>
      AuthenticationCode(
        otp: json["otp"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "message": message,
      };
}
