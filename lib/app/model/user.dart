class User{
  final String? nama;

  User({this.nama});

  factory User.fromMap(Map<String, dynamic>? map)
  {
    return User(nama: map!["nama"]);
  }
}