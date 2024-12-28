import 'category.dart';

class Book {
  String _title;
  String _author;
  String _description;
  double _price;
  int _inStock;
  String? _award;
  Category _category;

  // Business rule: Follow the pattern 20OFF, 30OFF, 40OFF, 50OFF
  late String cupom;

  Book(this._title, this._author, this._description, this._price, this._inStock,
      this._category,
      [this._award]);

  // Set Cuppom
  void addCupom(String cupom) {
    this.cupom = cupom;
    _applyDiscount();
  }

  void _applyDiscount() {
    String numero = cupom.replaceAll('OFF', '');
    double valorDesconto = double.parse(numero);
    _price = _price - (_price * (valorDesconto / 100));
  }

  get title => this._title;

  set title(value) => this._title = value;

  get author => this._author;

  set author(value) => this._author = value;

  get description => this._description;

  set description(value) => this._description = value;

  get price => this._price;

  set price(value) => this._price = value;

  get inStock => this._inStock;

  set inStock(value) => this._inStock = value;

  get award => this._award;

  set award(value) => this._award = value;

  get category => this._category;

  set category(value) => this._category = value;

  get getCupom => this.cupom;

  @override
  String toString() {
    return 'Book{_title: $_title, _author: $_author, _description: $_description, _price: $_price, _inStock: $_inStock, _award: $_award, _category: $_category}';
  }
}
