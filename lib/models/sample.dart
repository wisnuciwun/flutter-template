class TokenExpired {
  late String message;

  TokenExpired({required this.message});

  factory TokenExpired.fromJson(Map<String, dynamic> json) {
    return TokenExpired(message: json['message'] as String);
  }
}
