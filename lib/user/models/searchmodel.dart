class SearchModel {
  final int id;
  final String name;
  final double price;

  const SearchModel({
    required this.id,
    required this.name,
    required this.price,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'price': double price,
      } =>
        SearchModel(
          id: id,
          name: name,
          price: price,
        ),
      _ => throw const FormatException('Failed to load details.'),
    };
  }
}
