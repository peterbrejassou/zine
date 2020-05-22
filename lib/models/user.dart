class User {
  final String uid;
  final String username;
  final String firstname;
  final String lastname;
  final String email;
  final String photo;
  final int level;
  final int points;
  final List<dynamic> friends;

  User({
    this.uid,
    this.username,
    this.firstname,
    this.lastname,
    this.email,
    this.photo,
    this.level,
    this.points,
    this.friends,
  });

  factory User.fromMap(Map data) {
    return User(
      uid: data['uid'] ?? '',
      username: data['username'] ?? '',
      firstname: data['firstname'] ?? '',
      lastname: data['lastname'] ?? '',
      email: data['email'] ?? '',
      photo: data['photo'] ?? '',
      level: data['level'] ?? 1,
      points: data['points'] ?? 0,
      friends: (data['friends'] as List ?? []).map((friend) => friend).toList(),
    );
  }
}
