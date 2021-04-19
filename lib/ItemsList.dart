class ItemsList {
  String _name;
  String _num;
  String _img;
  var page;
  ItemsList(this._name, this._num, this._img, this.page);

  String get num => _num;

  String get name => _name;
  String get img => _img;
}
