class Category {
  final String id;
  final String title;
  final String icon;
  final String color;

  Category({this.id, this.title, this.icon, this.color});

  factory Category.fromMap(Map data) {
    return Category(
        id: data['id'] ?? '',
        title: data['title'] ?? '',
        icon: data['icon'] ?? '',
        color: data['color'] ?? '0xFF4FB286');
  }
}
