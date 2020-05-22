class Article {
  final String id;
  final String title;
  final String content;
  final String category;
  final String img;
  final List<dynamic> likes;

  Article({
    this.id,
    this.title,
    this.content,
    this.category,
    this.img,
    this.likes,
  });

  factory Article.fromMap(Map data) {
    return Article(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      category: data['category'] ?? 'Aucune catégorie',
      img: data['img'] ?? '',
      likes: (data['likes'] as List ?? []).map((like) => like).toList(),
    );
  }
}
