class ProductModel {
  final int index;

  final String name;

  final List<String> searchIndex;

  ProductModel(
      {required this.index, required this.name, this.searchIndex = const []});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      index: int.parse(json['index']),
      name: json['name'],
      searchIndex: List.generate(
        json['name'].length,
        (index) =>
            json['name'].toString().toLowerCase().substring(0, index + 1),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'index': index, 'name': name, "searchIndex": searchIndex};
  }
}
