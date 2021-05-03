class Product {
  int _id;
  String _name;
  String _text;
  String _amount;
  String _img;
  String img2;
  String img3;
  String img4;
  String _num;
  String _number;
  String _group;
  Map color_size;
  String user;
  String phone;
  String city;

  Product(
      this._id,
      this._name,
      this._text,
      this._amount,
      this._img,
      this._num,
      this._number,
      this._group,
      this.color_size,
      this.img2,
      this.img3,
      this.img4,
      this.user,
      this.phone,
      this.city);

  String get number => _number;

  String get num => _num;

  String get img => _img;

  String get amount => _amount;

  String get text => _text;

  String get name => _name;

  int get id => _id;

  String get group => _group;
}
