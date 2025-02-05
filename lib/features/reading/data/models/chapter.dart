class Chapter {
  final int id;
  final String title;
  final String? image;
  final List<String> paragraphs;

  Chapter({required this.id, required this.title, required this.paragraphs, this.image});

  // Map formatına dönüştürmek için toMap fonksiyonu
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'paragraphs': paragraphs,
      'image': image,
    };
  }

  // Map'ten Chapter nesnesi oluşturmak için fromMap fonksiyonu
  factory Chapter.fromMap(Map<String, dynamic> data) {
    return Chapter(
      id: data['id'],
      title: data['title'],
      paragraphs: List<String>.from(data['paragraphs']),
      image: data["image"],
    );
  }
}
