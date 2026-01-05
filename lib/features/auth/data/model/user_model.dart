// "first_name": "tanvir",
// "last_name": "khan",
// "email": "khan1@gmail.com",
// "email_verified": true,
// "phone": "01873634342",
// "phone_verified": false,
// "avatar_url": null,
// "city": "dhaka",
// "role": 0

class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String? avatarUrl;
  final String city;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.avatarUrl,
    required this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      avatarUrl: json['avatar_url'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'avatar_url': avatarUrl,
      'city': city,
    };
  }
}
