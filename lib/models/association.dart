class Association {
  final String id;
  final String name;
  final String description;
  final String img;
  final int pointsDonation;
  final String textDonation;

  Association({
    this.id,
    this.name,
    this.description,
    this.img,
    this.pointsDonation,
    this.textDonation,
  });

  factory Association.fromMap(Map data) {
    return Association(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      img: data['img'] ?? '',
      pointsDonation: data['pointsDonation'] ?? 0,
      textDonation: data['textDonation'] ?? '',
    );
  }
}
