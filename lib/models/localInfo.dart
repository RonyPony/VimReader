class LocalCarInfo {
  String? vim;
  String? year;
  LocalCarInfo(this.vim,this.year);
  LocalCarInfo.fromJson(Map<String, dynamic> json) {
    vim = json['vim'];
    year = json['year'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vim'] = this.vim;
    data['year'] = this.year;
    return data;
  }
}