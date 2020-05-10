class User {
  final String uid;
  final String username;
  final String email;
  final int level;
  final int points;

  User({
    this.uid,
    this.username,
    this.email,
    this.level,
    this.points,
  });

  factory User.fromMap(Map data) {
    return User(
      uid: data['uid'] ?? '',
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      level: data['level'] ?? 1,
      points: data['points'] ?? 0,
    );
  }
}
