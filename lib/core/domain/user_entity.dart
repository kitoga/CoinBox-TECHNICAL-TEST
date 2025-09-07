class UserEntity {
  final String id;
  final String name;
  final String email;
  final String? avatar;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntity && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'UserEntity{id: $id, name: $name, email: $email}';
  }
}
