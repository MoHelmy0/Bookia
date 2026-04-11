class UserModel {
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String? image;

  UserModel({
    required this.name,
    required this.email,
    this.phone,
    this.address,
    this.image,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? address,
    String? image,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      image: image ?? this.image,
    );
  }
}
