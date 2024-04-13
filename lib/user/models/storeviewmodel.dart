class StoreViewModel {
  String? name;
  String? distance;

  StoreViewModel({
    this.name,
    this.distance,
  });

  StoreViewModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    distance = json['distance'];
  }
}
