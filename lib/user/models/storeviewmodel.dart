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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['distance'] = this.distance;

    return data;
  }
}
