class StockViewModel {
  int? id;
  String? name;
  String? mrp;
  Null? sp;
  bool? presc;
  String? manf;
  String? sidef;
  String? howtouse;
  String? description;
  String? therapyclass;

  StockViewModel(
      {this.id,
      this.name,
      this.mrp,
      this.sp,
      this.presc,
      this.manf,
      this.sidef,
      this.howtouse,
      this.description,
      this.therapyclass});

  StockViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mrp = json['mrp'];
    sp = json['sp'];
    presc = json['presc'];
    manf = json['manf'];
    sidef = json['sidef'];
    howtouse = json['howtouse'];
    description = json['description'];
    therapyclass = json['therapyclass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mrp'] = this.mrp;
    data['sp'] = this.sp;
    data['presc'] = this.presc;
    data['manf'] = this.manf;
    data['sidef'] = this.sidef;
    data['howtouse'] = this.howtouse;
    data['description'] = this.description;
    data['therapyclass'] = this.therapyclass;
    return data;
  }
}
