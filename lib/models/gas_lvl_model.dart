class gas_lvl{
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ValueModel> _values;
  List<ValueModel> get values => _values;

  gas_lvl({required totalSize, required typeId, required offset, required values}){
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._values = values;
  }

  gas_lvl.fromJson(Map<String, dynamic> json){
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['values'] != null){
      _values = <ValueModel>[];
      json['values'].forEach((v){
        _values.add(ValueModel.fromJson(v));
      });
    }
  }


}

class ValueModel{
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  int? value;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ValueModel(
  {
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.value,
    this.createdAt,
    this.updatedAt,
    this.typeId
});
  ValueModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    value = json['value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];

  }

}